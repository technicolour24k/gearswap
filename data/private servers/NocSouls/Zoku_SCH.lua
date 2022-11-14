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
activeArts = "default"

function get_sets()
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
	sets.SCH.midcast = {}
    sets.SCH.midcast['Light Arts'] ={}
    sets.SCH.midcast['Dark Arts'] ={}
	sets.SCH.midcast.Cure = {
        sub="Curatio Grip",
        ammo="Quartz Tathlum +1",
        head=SCH_AF_HEAD,
        body=SCH_RELIC_BODY,
        hands="Weatherspoon Cuffs",
        legs=SCH_AF_LEGS,
        feet=SCH_RELIC_FEET,
        waist="Paewr Belt",
        left_ring="Ephedra Ring",
        right_ring="Ephedra Ring",
        back="Dew Silk Cape +1",
    }
    sets.SCH.midcast.Cure['Light Arts'] = set_combine(sets.SCH.midcast.Cure, {})
    sets.SCH.midcast.Cure['Dark Arts'] = set_combine(sets.SCH.midcast.Cure, {})
    sets.SCH.midcast.Cursna = {
        left_ring="Ephedra Ring",
        right_ring="Ephedra Ring",
    }
	sets.SCH.midcast.StatFix = {}
	sets.SCH.midcast['Enhancing Magic'] = {}
	sets.SCH.midcast['Enhancing Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Enhancing Magic'], sets.common.midcast.EnhancingDuration, {})
	sets.SCH.midcast['Enhancing Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Barspells = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Stoneskin = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Aquaveil = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Regen = set_combine(sets.SCH.midcast['Enhancing Magic'], {
        head=SCH_EMPYREAN_HEAD,
    })
	sets.SCH.midcast['Elemental Magic'] = set_combine(sets.common.midcast['Elemental Magic'], {
        sub="Elan Strap",
        ammo="Erlene's Notebook",
        head=SCH_AF_HEAD,
        body="Gyve Doublet",
        hands=SCH_EMPYREAN_HANDS,
        legs=SCH_RELIC_LEGS,
        feet=SCH_EMPYREAN_FEET,
        neck="Stoicheion Medal",
        waist="Argute Belt",
        left_ear="Hecate's Earring",
        right_ear="Sortiarius Earring",
        left_ring="Acumen Ring",
        right_ring="Strendu Ring",
        back="Izdubar Mantle",
    })
    sets.SCH.midcast['Elemental Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
    sets.SCH.midcast['Elemental Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
    sets.SCH.midcast['Elemental Magic']['Ebullience'] = set_combine(sets.SCH.midcast['Elemental Magic'], {
        head=SCH_EMPYREAN_HEAD
    })
    sets.SCH.midcast['Rapture'] = set_combine({
        head=SCH_EMPYREAN_HEAD
    })
	sets.SCH.midcast['Dark Magic'] = set_combine(sets.common.midcast['Dark Magic'], {})
    sets.SCH.midcast['Dark Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Dark Magic'], {})
    sets.SCH.midcast['Dark Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Dark Magic'], {})
	sets.SCH.midcast['Enfeebling Magic'] = set_combine(sets.common.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Enfeebling Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Enfeebling Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Helixes'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
    sets.SCH.midcast['Helixes']['Light Arts'] = set_combine(sets.SCH.midcast['Helixes'], {})
    sets.SCH.midcast['Helixes']['Dark Arts'] = set_combine(sets.SCH.midcast['Helixes'], {})
    sets.SCH.midcast['Helixes']['Ebullience'] = set_combine(sets.SCH.midcast['Helixes'], {
        head=SCH_EMPYREAN_HEAD
    })
    sets.SCH.midcast['Storms'] = {}
    sets.SCH.midcast['Storms']['Light Arts'] = set_combine(sets.SCH.midcast['Storms'], {})
    sets.SCH.midcast['Storms']['Dark Arts'] = set_combine(sets.SCH.midcast['Storms'], {})
    sets.SCH.midcast['Kaustra'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})

    sets.JobAbility['Tabula Rasa'] = {}
    sets.JobAbility['Light Arts'] = {}
    sets.JobAbility['Dark Arts'] = {}
    sets.JobAbility['Sublimation'] = {}
    sets.JobAbility['Modus Veritas'] = {}
    sets.JobAbility['Enlightenment'] = {}
    sets.JobAbility['Libra'] = {}
    sets.JobAbility['Caper Emissarius'] = {}
    sets.JobAbility['Penury'] = {}
    sets.JobAbility['Addendum: White']= {}
    sets.JobAbility['Celerity'] = {}
    sets.JobAbility['Accession'] = {}
    sets.JobAbility['Rapture'] = {}
    sets.JobAbility['Altruism'] = {}
    sets.JobAbility['Tranquility'] = {}
    sets.JobAbility['Perpetuance'] = {}
    sets.JobAbility['Parsimony'] = {}
    sets.JobAbility['Alacrity'] = {}
    sets.JobAbility['Addendum: Black'] = {}
    sets.JobAbility['Manifestation'] = {}
    sets.JobAbility['Ebullience'] = {}
    sets.JobAbility['Focalization'] = {}
    sets.JobAbility['Equanmity'] = {}
    sets.JobAbility['Immanence'] = {}

    sets.WeaponSkills['Tartarus Torpor'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Omniscience'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Garland of Bliss'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Vidohunir'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Gate of Tartarus'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Shattersoul'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Cataclysm'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
    sets.WeaponSkills['Spirit Taker'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

    sets.aftercast = {}
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, sets.misc.AllJobs['DTCombo'], {
        sub={ name="Mensch Strap", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
        ammo="Erlene's Notebook",
        legs="Spurrina Slops",
        feet="Iaso Boots",
        neck="Loricate Torque +1",
        waist="Paewr Belt",
        left_ear={ name="Moonshade Earring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
        right_ring={ name="Castor's Ring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
    })
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
    
	if sets.SCH.midcast[spell.english] then
		if activeArts == "default" then
            equip(sets.SCH.midcast[spell.english])            
        else
            equip(sets.SCH.midcast[spell.english][activeArts])
        end
    elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif spellContains(spell.english,'Cure') or spellContains(spell.english,'Cura') then 
        if activeArts == "default" then
            equip(sets.SCH.midcast.Cure)            
        else
            equip(sets.SCH.midcast.Cure[activeArts])
        end
	end

	if (sets.SCH.midcast[spell.skill]) then
        if activeArts == "default" then
            equip(sets.SCH.midcast[spell.skill])            
        else
            equip(sets.SCH.midcast[spell.skill][activeArts])
        end
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
        if activeArts == "default" then
            equip(sets.SCH.midcast['Helixes'])
        else
		    equip(sets.SCH.midcast['Helixes'][activeArts])
        end
        if (buffactive['Ebullience']==1) then
            equip(sets.SCH.midcast['Helixes']['Ebullience'])
        end
    end
    if (Storms:contains(spell.english)) then
        if activeArts == "default" then
            equip(sets.SCH.midcast['Storms'])
        else
		    equip(sets.SCH.midcast['Storms'][activeArts])
        end	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
    if(buffactive['Ebullience']==1) then
        equip(sets.SCH.midcast['Elemental Magic']['Ebullience'])
    elseif (buffactive['Rapture']==1) then
        equip(sets.SCH.midcast['Rapture'])
    end
    weathercheck(spell.element)
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
    common_self_command(command)
end