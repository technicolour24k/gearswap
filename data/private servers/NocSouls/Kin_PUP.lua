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

PUPStyle = "Melee"

function get_sets()
	local mjob = player.main_job
	init_gear_sets(mjob)
	sets.PUP={}
	sets.JobAbility={}
	sets.JobAbility["Overdrive"] = {}
	sets.JobAbility["Activate"] = {}
	sets.JobAbility['Repair']= {}
	sets.JobAbility["Tactical Switch"] = {}
	sets.JobAbility['Cooldown']= {}
	sets.JobAbility['Deus Ex Machina'] = {}
	sets.JobAbility['Maintenance'] = {}
	sets.JobAbility['Heady Artifice'] = {}
	sets.JobAbility['Deploy'] = {}
	sets.JobAbility['Deactivate'] = {}
	sets.JobAbility['Retrieve'] = {}
	sets.JobAbility['Maneuvers'] = {}
	sets.JobAbility['Fire Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Ice Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Wind Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Earth Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Thunder Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Water Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Light Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	sets.JobAbility['Dark Maneuver'] = set_combine(sets.JobAbility['Maneuvers'], {})
	
	
	

	sets.PUP.midcast={}
	sets.PUP.midcast['EnhancingDuration'] = set_combine(sets.common.midcast.EnhancingDuration, {
		hands=PUP_AF_HANDS,
		feet=PUP_AF_FEET
	})

	sets.PUP.midcast['EnfeeblingDuration'] = set_combine(sets.common.midcast.EnfeeblingDuration, {
	})

	sets.PUP.midcast.Cure = {
		head="Iaso Mitra", --11%
		hands="Bokwus Gloves", --13% => 24%
		legs=PUP_AF_LEGS, --11% => 35%
		back="Ghostfyre cape", --6% => 41%
		neck="Phalaina locket", --4% => 45%
		left_ear="Roundel Earring", --5% => 50%
		left_ring="Lebeche Ring",
		right_ring="Sirona's ring"
	}
	sets.PUP.midcast['Refresh'] = set_combine(sets.common.midcast.EnhancingDuration, sets.PUP.midcast.EnhancingDuration, {
		legs=PUP_AF_LEGS,
		body=PUP_AF_BODY
	})
	sets.PUP.midcast['Refresh II'] = set_combine(sets.PUP.midcast['Refresh'], {})

	sets.PUP.midcast['Spikes'] = {legs=PUP_RELIC_LEGS}
	sets.PUP.midcast['Blaze Spikes'] = sets.PUP.midcast['Spikes']
	sets.PUP.midcast['Ice Spikes'] = sets.PUP.midcast['Spikes']
	sets.PUP.midcast['Shock Spikes'] = sets.PUP.midcast['Spikes']

	sets.PUP.midcast['MAB'] = set_combine(sets.misc.AllJobs.MAB, {
		head="Leth. Chappel +1",
		body="Gyve Doublet",
		hands="Quauhpilli Gloves",
		legs="Gyve Trousers",
		feet="Vitiation Boots +1",
		waist="Othila Sash",
		right_ring="Strendu Ring",
	})

	sets.PUP.midcast['Divine Magic'] = {}
	sets.PUP.midcast['Healing Magic'] = {}
	sets.PUP.midcast['Enhancing Magic'] = set_combine(sets.PUP.midcast['EnhancingDuration'],{
		body=PUP_RELIC_BODY,
		legs=PUP_AF_LEGS,
		feet=PUP_AF_FEET,
		left_ear="Andoaa Earring",
		left_ring={ name="Stikini Ring +1", augments={'"Refresh"+20','"Refresh"+20','"Refresh"+20','"Refresh"+20',}},
	
	})
	sets.PUP.midcast['Enfeebling Magic'] = set_combine(sets.PUP.midcast['EnfeeblingDuration'],{
		ammo={ name="Erlene's Notebook", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		neck={ name="Stoicheion Medal", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		left_ear="Hecate's Earring",
		right_ear="Novio Earring",
		back={ name="Izdubar Mantle", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
	
	})
	sets.PUP.midcast['Elemental Magic'] = set_combine(sets.PUP.midcast['MAB'], {})
	sets.PUP.midcast['Dark Magic'] = {}

	sets.PUP.midcast['Helixes'] = set_combine(sets.PUP.midcast['MAB'], sets.common.midcast['Helixes'], {})
	sets.PUP.midcast['Helixes']['Light Arts'] = set_combine(sets.PUP.midcast['Helixes'], {})
    sets.PUP.midcast['Helixes']['Dark Arts'] = set_combine(sets.PUP.midcast['Helixes'], {})



	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Melee = set_combine(sets.weapons[mjob]["Hand-to-Hand"], sets.misc.AllJobs.TP,{
		ammo=empty,
		ranged="Animator P",
		head=PUP_AF_HEAD,
		body=PUP_AF_BODY,
		hands=PUP_AF_HANDS,
		legs=PUP_AF_LEGS,
		feet=PUP_AF_FEET,
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},	
	})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Melee, sets.misc.AllJobs['DTCombo'],{
		feet="Hermes' Sandals"
	})

	sets.WeaponSkills["Spinning Attack"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Tornado Kick"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Victory Smite"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Shijin Spiral"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})

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

	if sets.PUP.midcast[spell.english] then
		equip(sets.PUP.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.PUP.midcast.Cure)
	end

	if sets.PUP.midcast[spell.skill] then
		equip(sets.PUP.midcast[spell.skill])
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
            equip(sets.PUP.midcast['Helixes'])
        else
		    equip(sets.PUP.midcast['Helixes'][activeArts])
        end
    end

	weathercheck(spell.element, spell.skill)
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

function aftercast(spell)
	equip(sets.weapons.PUP[PUPStyle])
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][PUPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][PUPStyle])
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
		if PUPStyle == "Melee" then
			PUPStyle = "Mage"
		else
			PUPStyle="Melee"
		end
		infoLog("PUP Style is now: " .. PUPStyle.. "!")
		equip(sets.weapons.PUP[PUPStyle])
		if (sets.aftercast[player.status]) then
			equip(sets.aftercast[player.status])
		end
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][PUPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
