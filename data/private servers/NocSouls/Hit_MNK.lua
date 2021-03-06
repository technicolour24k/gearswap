include("organizer-lib")
include("includes/common-functions")
include("includes/config")

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

TPStyle = "Default"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	local mjob = player.main_job
	init_gear_sets(mjob)
	
	
	sets.MAB = set_combine(sets.misc.AllJobs.MAB, {
		
	})
	sets.JobAbility["Hundred Fists"] = {}
	sets.JobAbility["Boost"] = {}
	sets.JobAbility["Focus"] = {}
	sets.JobAbility['Dodge'] = {}
	sets.JobAbility['Chakra'] = {}
	sets.JobAbility['Counterstance'] = {}
	sets.JobAbility['Jump'] = {}
	sets.JobAbility['Chi Blast'] = {}
	sets.JobAbility['Formless Strikes'] = {}
	sets.JobAbility['Footwork'] = {}
	sets.JobAbility['Perfect Counter'] = {}
	sets.JobAbility['Impetus'] = {}
	sets.JobAbility['Inner Strength'] = {}

	sets.WeaponSkills["Spinning Attack"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Tornado Kick"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Victory Smite"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Shijin Spiral"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.MAB,{})
	sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

	sets.midcast.Cure = {}

	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged = {
		head=MNK_AF_HEAD,
		body=MNK_AF_BODY,
		hands=MNK_RELIC_HANDS,
		legs=MNK_RELIC_LEGS,
		feet=MNK_RELIC_FEET,
		neck="Loricate Torque +1",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear={ name="Telos Earring" },
		right_ear={ name="Tati Earring" },
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
		back={ name="Laic Mantle", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
	}

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, sets.misc.AllJobs['DTCombo'],{
		right_ring = "Stikini Ring +1",
		feet = "Herald's Gaiters",
		right_ear = "Moonshade Earring"
	})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")

end

function pretarget (spell)
	confirmTarget(spell.skill,spell.target.type)
end

function precast(spell)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
		
	if sets.JobAbility[spell.english] then
		equip(sets.JobAbility[spell.english])
	end

	if sets.WeaponSkills[spell.english] then
		equip(sets.WeaponSkills[spell.english])
	end

	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end

	if spell.action_type == "Magic" then
		equip(sets.precast.FastCast.Default)
	end
end
function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.midcast.Cure)
	end
	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.midcast.ConserveMP)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

function aftercast(spell)
	equip(sets.aftercast[player.status])
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	equip(sets.aftercast[player.status])
end

function buff_change(name, gain)
	if name == "Trick Attack" and gain == "false" then
		equip(sets.aftercast.Idle)
	elseif name == "Sneak Attack" and gain == "false" then
		if player.status == "Idle" then
			equip_idle_set()
		elseif sets.aftercast[player.status][TPStyle] then
			equip(sets.aftercast[player.status][TPStyle], sets.aftercast)
		else
			equip(sets.aftercast.Idle, sets.aftercast)
		end
	end
end

function area_change(new,old)

end

function self_command(command)

	if command:lower() == "status-check" then
		if (config.oneClickRemedies) then
			clearStatuses()
		end
	end

	equip(sets.aftercast[player.status])
end
