include("organizer-lib")
include("includes/common-functions")
include("includes/config")

skillup = 0
showInfo = false
local mjob = player.main_job
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80
local activeArts = ""

function get_sets()
    infoLog(mjob)
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')

	init_gear_sets(mjob)

	sets.SCH = {}
    sets.SCH.precast = {}
    sets.SCH.precast['Light Arts'] = set_combine(sets.SCH.precast, {})
    sets.SCH.precast['Dark Arts'] = set_combine(sets.SCH.precast, {})
    sets.SCH.precast['Helixes'] = {}
    sets.SCH.precast['Helixes']['Light Arts'] = set_combine(sets.SCH.precast['Helixes'], {})
    sets.SCH.precast['Helixes']['Dark Arts'] = set_combine(sets.SCH.precast['Helixes'], {})
	sets.SCH.midcast ={}
    sets.SCH.midcast['Light Arts'] ={}
    sets.SCH.midcast['Dark Arts'] ={}
	sets.SCH.midcast.Cure = {}
    sets.SCH.midcast.Cure['Light Arts'] = set_combine(sets.SCH.midcast.Cure, {})
    sets.SCH.midcast.Cure['Dark Arts'] = set_combine(sets.SCH.midcast.Cure, {})
    sets.SCH.midcast.Cursna = {}
	sets.SCH.midcast.StatFix = {}
	sets.SCH.midcast['Enhancing Magic'] = {}
	sets.SCH.midcast.Barspells = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Stoneskin = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Aquaveil = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Regen = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast['Elemental Magic'] = set_combine(sets.common.midcast['Elemental Magic'], {})
    sets.SCH.midcast['Elemental Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
    sets.SCH.midcast['Elemental Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
	sets.SCH.midcast['Dark Magic'] = set_combine(sets.common.midcast['Dark Magic'], {})
    sets.SCH.midcast['Dark Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Dark Magic'], {})
    sets.SCH.midcast['Dark Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Dark Magic'], {})
	sets.SCH.midcast['Enfeebling Magic'] = set_combine(sets.common.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Enfeebling Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Enfeebling Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Helixes'] = {}
    sets.SCH.midcast['Helixes']['Light Arts'] = set_combine(sets.SCH.midcast['Helixes'], {})
    sets.SCH.midcast['Helixes']['Dark Arts'] = set_combine(sets.SCH.midcast['Helixes'], {})
    sets.SCH.midcast['Storms'] = {}
    sets.SCH.midcast['Storms']['Light Arts'] = set_combine(sets.SCH.midcast['Storms'], {})
    sets.SCH.midcast['Storms']['Dark Arts'] = set_combine(sets.SCH.midcast['Storms'], {})
    sets.SCH.midcast['Kaustra'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})

    sets.aftercast = {}
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {})
	sets.aftercast.Engaged = {}

end

	CureSpells = S{	'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Cure V', 'Cure VI',
					'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Curaga V',
					'Cura', 'Cura II', 'Cura III'}

	StatSpells = S{	'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Erase'}
	RegenSpells = S{'Regen', 'Regen II', 'Regen III', 'Regen IV', 'Regen V'}
    Helixes = S{'Geohelix','Hydrohelix','Anemohelix','Pyrohelix','Cryohelix','Ionohelix','Noctohelix','Luminohelix'}
    Storms = S{'Sandstorm','Rainstorm','Windstorm','Firestorm','Hailstorm','Thunderstorm','Voidstorm','Aurorastorm'}
	
	

function precast(spell)
	if spell.action_type == 'Magic' then
        equip(sets.common.precast.FastCast.Default)
    end
	
    if spellContains(spell.english,' Arts') then
        activeArts = spell.english
    end
	
end

function midcast(spell)  
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.SCH.midcast[spell.english][activeArts] then
        -- equip(sets.SCH.midcast[spell.english])
		equip(sets.SCH.midcast[spell.english][activeArts])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif spellContains(spell.english,'Cure') or spellContains(spell.english,'Cura') then 
        equip(sets.SCH.midcast.Cure[activeArts])
	end

	if sets.SCH.midcast[spell.skill][activeArts] then
		equip(sets.SCH.midcast[spell.skill][activeArts])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
    if (RegenSpells:contains(spell.english)) then
		equip(sets.SCH.midcast.Regen)
	end
    if (Helixes:contains(spell.english)) then
		equip(sets.SCH.midcast['Helixes'][activeArts])
	end
    if (Storms:contains(spell.english)) then
		equip(sets.SCH.midcast['Storms'][activeArts])
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(sets.aftercast.Engaged)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)

end

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "cmd" then

	end
end