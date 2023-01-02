include("organizer-lib")
include("includes/common-functions")
include("includes/config")
include('private servers/'..server..'/common-gearsets')
include('private servers/'..server..'/custom-info')
--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

WHMStyle = "Melee"

function get_sets()
	local mjob = player.main_job
	init_gear_sets(mjob)
	sets.WHM={}
	sets.JobAbility={}
	sets.JobAbility["Chainspell"] = {}
	sets.JobAbility["Spontaneity"] = {}

	sets.WHM.midcast={}
	sets.WHM.midcast['EnhancingDuration'] = set_combine(sets.common.midcast.EnhancingDuration, {})

	sets.WHM.midcast['EnfeeblingDuration'] = set_combine(sets.common.midcast.EnfeeblingDuration, {
	})

	sets.WHM.midcast.Cure = {
		head="Iaso Mitra", --11%
		hands="Bokwus Gloves", --13% => 24%
		legs=WHM_AF_LEGS, --11% => 35%
		back="Ghostfyre cape", --6% => 41%
		neck="Phalaina locket", --4% => 45%
		left_ear="Roundel Earring", --5% => 50%
		left_ring="Lebeche Ring",
		right_ring="Sirona's ring"
	}
	sets.WHM.midcast['Refresh'] = set_combine(sets.common.midcast.EnhancingDuration, sets.WHM.midcast.EnhancingDuration, {})
	sets.WHM.midcast['Refresh II'] = set_combine(sets.WHM.midcast['Refresh'], {})

	sets.WHM.midcast['Spikes'] = {legs=WHM_RELIC_LEGS}
	sets.WHM.midcast['Blaze Spikes'] = sets.WHM.midcast['Spikes']
	sets.WHM.midcast['Ice Spikes'] = sets.WHM.midcast['Spikes']
	sets.WHM.midcast['Shock Spikes'] = sets.WHM.midcast['Spikes']

	sets.WHM.midcast['MAB'] = set_combine(sets.misc.AllJobs.MAB, {
		head="Straw Hat",
		neck="Jeweled Collar",
		left_ear="Moldavite Earring",
		right_ear="Novio Earring",
		left_ring="Eremite's Ring +1",
		right_ring="Eremite's Ring +1",
		waist="Hachirin-no-Obi",
		hands="Vagabond's Gloves",
		legs="Vagabond's Hose",
		feet="Vagabond's Boots"
	})

	sets.WHM.midcast['Divine Magic'] = {}
	sets.WHM.midcast['Healing Magic'] = {}
	sets.WHM.midcast['Enhancing Magic'] = set_combine(sets.WHM.midcast['EnhancingDuration'],{})
	sets.WHM.midcast['Enfeebling Magic'] = set_combine(sets.WHM.midcast['EnfeeblingDuration'],{
		ammo={ name="Erlene's Notebook", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		head=WHM_AF_HEAD,
		body=WHM_EMPYREAN_BODY,
		hands=WHM_EMPYREAN_HANDS,
		legs=WHM_AF_LEGS,
		feet=WHM_RELIC_FEET,
		neck={ name="Stoicheion Medal", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		left_ear="Regal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
		back={ name="Izdubar Mantle", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
	
	})
	sets.WHM.midcast['Elemental Magic'] = set_combine(sets.WHM.midcast['MAB'], {})
	sets.WHM.midcast['Dark Magic'] = {}

	sets.WHM.midcast['Helixes'] = set_combine(sets.WHM.midcast['MAB'], sets.common.midcast['Helixes'], {})
	sets.WHM.midcast['Helixes']['Light Arts'] = set_combine(sets.WHM.midcast['Helixes'], {})
    sets.WHM.midcast['Helixes']['Dark Arts'] = set_combine(sets.WHM.midcast['Helixes'], {})

	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Melee = set_combine(sets.weapons[mjob]["Melee"], sets.misc.AllJobs.TP,{
		head="Ayanmo Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands=WHM_AF_HANDS,
		legs="Ayanmo Cosciales +2",
		feet="Ayanmo Gambieras +2",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},	
	})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Melee, sets.misc.AllJobs['DTCombo'],{
		feet="Herald's Gaiters"
	})

	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.WHM.midcast['MAB'],{})
	sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

	--FTP Replicating WS
	sets.WeaponSkills['Requiescat'] = set_combine(sets.WeaponSkills['Fotia'],sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Chant du Cygne'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Swift Blade'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Vorpal Blade'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	-- MAB modded WS
	sets.WeaponSkills['Sanguine Blade'] = set_combine(sets.misc.AllJobs.MAB, {})
	sets.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobs.MAB, {})
	-- Standard mods
	sets.WeaponSkills['Savage Blade'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'],{--50% STR, 50% MND - Equal footing for both
		neck="Imbodla Necklace",
		left_ear="Regal Earring",
		right_ear="Aqua Pearl",
		back="Laic Mantle",
	}) 
	sets.WeaponSkills['Knights of Round'] = {}
	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
end

function pretarget (spell)
	confirmTarget(spell.skill,spell.target.type)
end

function precast(spell)
	enemyImmunityCheck(spell.target.name,spell.english)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
	commonPrecastRules(sets, spell.english,spell.skill, spell.action_type)
end
function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.WHM.midcast[spell.english] then
		equip(sets.WHM.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.WHM.midcast.Cure)
	end

	if sets.WHM.midcast[spell.skill] then
		equip(sets.WHM.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end

	if (Helixes:contains(spell.english) or spellContains(spell.english, "Dia")) then
        if activeArts == "default" then
            equip(sets.WHM.midcast['Helixes'])
        else
		    equip(sets.WHM.midcast['Helixes'][activeArts])
        end
    end

	weathercheck(spell.element, spell.skill)
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

function aftercast(spell)
	equip(sets.weapons.WHM[WHMStyle])
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][WHMStyle])
	else
		equip(sets.aftercast[player.status])
	end
	
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][WHMStyle])
	else
		equip(sets.aftercast[player.status])
	end
end

function buff_change(name, gain)

end

function area_change(new,old)

end

function self_command(command)
	if command:lower() == "togglegear" then
		send_command("gs enable sub")
		if WHMStyle == "Melee" then
			WHMStyle = "Mage"
		else
			WHMStyle="Melee"
		end
		infoLog("WHM Style is now: " .. WHMStyle.. "!")
		equip(sets.weapons.WHM[WHMStyle])
		if (sets.aftercast[player.status]) then
			equip(sets.aftercast[player.status])
		end
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][WHMStyle])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
