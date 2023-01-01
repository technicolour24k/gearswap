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
	sets.THF={}
	
	sets.THF.TH = {
		sub = "Sandung",
		hands = THF_RELIC_HANDS,
		feet = THF_EMPYREAN_FEET
	}
	sets.MAB = set_combine(sets.misc.AllJobs.MAB, {
		head="Wayfarer Circlet",
		waist = "Aquiline Belt",
		legs = "Limbo Trousers"
	})
	sets.JobAbility["Perfect Dodge"] = {}
	sets.JobAbility["Sneak Attack"] = {}
	sets.JobAbility["Trick Attack"] = {}
	sets.JobAbility.Flee = {feet = THF_AF_FEET}
	sets.JobAbility.Accomplice = {head = THF_EMPYREAN_HEAD}
	sets.JobAbility.Collaborator = {head = THF_EMPYREAN_HEAD}

	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Dancing Edge"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mandalic Stab"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Rudra's Storm"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		ammo = "Floestone",
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
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.MAB,{})
	sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

	sets.THF.midcast.Cure = {}

	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]["Daggers"],{
		ammo={ name="Yetshila +1", augments={'"Triple Atk."+2','"Triple Atk."+2','Crit.hit rate+5','Crit.hit rate+5',}},
		head=THF_AF_HEAD,
		body=THF_EMPYREAN_BODY,
		hands=THF_AF_HANDS,
		legs=THF_EMPYREAN_LEGS,
		feet="Savateur's Gaiters",
		neck="Loricate Torque +1",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear={ name="Telos Earring" },
		right_ear={ name="Tati Earring" },
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
		back={ name="Laic Mantle", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
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

	disable("main", "sub")
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

	if sets.THF.midcast[spell.english] then
		equip(sets.THF.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.THF.midcast.Cure)
	end

	if sets.THF.midcast[spell.skill] then
		equip(sets.THF.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
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
	if command:lower() == "togglegear" then
		send_command("gs enable sub")
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
