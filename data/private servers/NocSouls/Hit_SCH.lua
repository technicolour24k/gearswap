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
	sets.SCH.midcast = {}
    sets.SCH.midcast['Light Arts'] ={}
    sets.SCH.midcast['Dark Arts'] ={}
	sets.SCH.midcast.Cure = {
        sub="Curatio Grip",
        ammo="Quartz Tathlum +1",
        head="Iaso Mitra",
        body="Heka's Kalasiris",
        hands="Revealer's Mitts",
        legs="Gyve Trousers",
        feet="Umbani Boots",
        waist="Paewr Belt",
        left_ring="Ephedra Ring",
        right_ring="Ephedra Ring",
        back="Izdubar Mantle",
    }
    sets.SCH.midcast.Cure['Light Arts'] = set_combine(sets.SCH.midcast.Cure, {})
    sets.SCH.midcast.Cure['Dark Arts'] = set_combine(sets.SCH.midcast.Cure, {})
    sets.SCH.midcast.Cursna = {}
	sets.SCH.midcast.StatFix = {}
	sets.SCH.midcast['Enhancing Magic'] = {}
	sets.SCH.midcast['Enhancing Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Enhancing Magic'], sets.common.midcast.EnhancingDuration, {})
	sets.SCH.midcast['Enhancing Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Barspells = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Stoneskin = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Aquaveil = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast.Regen = set_combine(sets.SCH.midcast['Enhancing Magic'], {})
	sets.SCH.midcast['Elemental Magic'] = set_combine(sets.common.midcast['Elemental Magic'], {
        sub="Elan Strap",
        ammo="Erlene's Notebook",
        head="Wayfarer Circlet",
        body="Gyve Doublet",
        hands="Quauhpilli Gloves",
        legs="Gyve Trousers",
        feet="Umbani Boots",
        neck="Eddy Necklace",
        waist="Othila Sash",
        left_ear="Hecate's Earring",
        right_ear="Moldavite Earring",
        left_ring="Acumen Ring",
        right_ring="Strendu Ring",
        back="Izdubar Mantle",
    })
    sets.SCH.midcast['Elemental Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
    sets.SCH.midcast['Elemental Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Elemental Magic'], {})
	sets.SCH.midcast['Dark Magic'] = set_combine(sets.common.midcast['Dark Magic'], {})
    sets.SCH.midcast['Dark Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Dark Magic'], {})
    sets.SCH.midcast['Dark Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Dark Magic'], {})
	sets.SCH.midcast['Enfeebling Magic'] = set_combine(sets.common.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Enfeebling Magic']['Light Arts'] = set_combine(sets.SCH.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Enfeebling Magic']['Dark Arts'] = set_combine(sets.SCH.midcast['Enfeebling Magic'], {})
    sets.SCH.midcast['Helixes'] = set_combine(sets.SCH.midcast['Elemental Magic'], sets.common.midcast['Helixes'] {})
    sets.SCH.midcast['Helixes']['Light Arts'] = set_combine(sets.SCH.midcast['Helixes'], {})
    sets.SCH.midcast['Helixes']['Dark Arts'] = set_combine(sets.SCH.midcast['Helixes'], {})
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
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {
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
        debugLog("Midcast Debug: Trying to equip sets.SCH.midcast["..spell.english.."]["..activeArts.."]")
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
        debugLog("Midcast Debug: Trying to equip sets.SCH.midcast["..spell.skill.."]["..activeArts.."]")
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
    end
    if (Storms:contains(spell.english)) then
        if activeArts == "default" then
            equip(sets.SCH.midcast['Storms'])
        else
		    equip(sets.SCH.midcast['Storms'][activeArts])
        end
    end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
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