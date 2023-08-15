
function get_sets()
	include("organizer-lib")
	-- include("includes/config")
	-- include('private servers/'..server..'/common-gearsets')
	-- include("includes/common-functions")
	-- include('private servers/'..server..'/custom-info')
	
	include("includes/common")
	showFCInfo = config.showFastCastInfo
	showSpellInfo = config.showSpellInfo
	showCancelInfo = config.showCancelInfo
	-- FastCast = 80
	
	--initialise local variables to inherit from master config
	
	TPStyle = "Default"
	init_gear_sets(mjob)
	sets.THF={}
	sets.THF.midcast = {}
	
	sets.THF.TH = {
		sub = "Sandung",
		hands = THF_RELIC_HANDS,
		feet = THF_EMPYREAN_FEET,
		waist = "Chaac Belt"
	}
	sets.THF.MAB = set_combine(sets.misc.AllJobs.MAB, {
		head="Wayfarer Circlet",
		waist = "Aquiline Belt",
		legs = "Limbo Trousers"
	})
	sets.JobAbility["Perfect Dodge"] = {}
	sets.JobAbility["Sneak Attack"] = {}
	sets.JobAbility["Trick Attack"] = {}
	sets.JobAbility['Flee'] = {feet = THF_AF_FEET}
	sets.JobAbility['Accomplice'] = {head = THF_EMPYREAN_HEAD}
	sets.JobAbility['Collaborator'] = {head = THF_EMPYREAN_HEAD}

	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Dancing Edge"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mandalic Stab"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Rudra's Storm"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		ammo = "Fire Bomblet",
		head = THF_EMPYREAN_HEAD,
		body = THF_AF_BODY,
		hands = THF_AF_HANDS,
		legs = THF_EMPYREAN_LEGS,
		feet = THF_RELIC_FEET,
		back = "Canny Cape",
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.THF.MAB,{})
	sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

	sets.THF.midcast.Cure = {}
	sets.THF.midcast.BLU_Physical = set_combine(sets.common.midcast.BLU_Physical,{})
	sets.THF.midcast.BLU_Buffs = set_combine(sets.common.midcast.BLU_Buffs,{})
	sets.THF.midcast.BLU_Nukes = set_combine(sets.common.midcast.BLU_Nukes, sets[mjob].midcast['MAB'], {})


	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]["Daggers"], sets.misc.AllJobs.TP,{
		head=THF_AF_HEAD,
		body=THF_EMPYREAN_BODY,
		hands=THF_AF_HANDS,
		legs=THF_EMPYREAN_LEGS,
		feet="Savateur's Gaiters",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
	})

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, sets.THF.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged[TPStyle], sets.misc.AllJobs['DTCombo'],{
		right_ring = "Stikini Ring +1",
		feet = THF_AF_FEET,
		right_ear = "Moonshade Earring"
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
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
	commonMidcastRules(sets, spell.english,spell.skill, spell.action_type)
	weathercheck(spell.element, spell.skill)
end

function aftercast(spell)

	if (buffactive['Sneak Attack'] == 1) and (buffactive['Trick Attack'] == 1)  then
		infoLog("<< SATA Active >>")
		equip(set_combine(sets.precast["Sneak Attack"], sets.precast['Trick Attack']))
	elseif (buffactive['Sneak Attack'] == 1) then
		infoLog("<< Sneak Attack Active >>")
		equip(sets.precast["Sneak Attack"])
	elseif (buffactive['Trick Attack'] == 1) then
		infoLog("<< Trick Attack Active >>")
		equip(sets.precast["Trick Attack"])
	else
		if player.status == "Engaged" then
			equip(sets.aftercast[player.status][TPStyle])
		else
			equip(sets.aftercast[player.status])
		end
	end
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
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
	if command:lower() == "toggle-gear" then
		if TPStyle == "Default" then
			TPStyle = "TH"
			equip(sets.aftercast.Engaged[TPStyle])
		elseif TPStyle == "TH" then
			TPStyle = "Accuracy"
		elseif TPStyle == "Accuracy" then
			TPStyle = "Evasion"
		else
			TPStyle="Default"
		end
		infoLog("TP Style is now: " .. TPStyle.. "!")
		equip(sets.aftercast.Engaged[TPStyle])
	end
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
