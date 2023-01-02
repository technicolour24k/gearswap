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
	sets.BLM = {}
	sets.BLM.precast = 	{}
	sets.BLM.midcast ={}

	sets.JobAbility['Manafont'] = {}
	sets.JobAbility['Elemental Seal'] = {}
	sets.JobAbility['Mana Wall'] = {feet=BLM_EMPYREAN_FEET}
	sets.JobAbility['Enmity Douse'] = {}
	sets.JobAbility['Manawell'] = {}
	sets.JobAbility['Subtle Sorcery'] = {}
	sets.JobAbility['Cascade'] = {}
	sets.JobAbility['Spontaneity'] = {}
	sets.JobAbility['Convert'] = {}

	sets.WeaponSkills['Gate of Tartarus'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Shattersoul'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Myrkr'] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Vidohunir'] = set_combine(sets.misc.AllJobs.MAB, sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		head = BLM_AF_HEAD,
		body = "Gyve Doublet",
		hands = BLM_AF_HANDS,
		legs = BLM_RELIC_LEGS,
		feet = BLM_RELIC_FEET,
		back = "Goetia Mantle",
	})
	sets.BLM.midcast['Elemental Magic'] = set_combine(sets.misc.AllJobs.MAB, sets.weapons.BLM['Elemental'], {
		right_ring={ name="Strendu Ring"},
		legs= {name="Gyve Trousers"},
		waist= {name="Searing Sash"},
		body = {name="Gyve Doublet"},
		hands = {name=BLM_EMPYREAN_HANDS},
		head = {name=BLM_AF_HEAD},
		neck = {name="Eddy Necklace"},
		feet = {name=BLM_AF_FEET},
		left_ear= {name="Moldavite Earring"}
	})
	sets.WeaponSkills['Tartarus Torpor'] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.BLM.midcast['Elemental Magic'],	{})
	
	sets.BLM.midcast.Cure = {}

	sets.BLM.midcast['DrainAspir'] = {
		legs=BLM_AF_LEGS
	}

    sets.BLM.midcast['Drain'] = set_combine(sets.BLM.midcast['DrainAspir'], {})
    sets.BLM.midcast['Aspir'] = set_combine(sets.BLM.midcast['DrainAspir'], {})
	
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]["Elemental"], sets.misc.AllJobs['DTCombo'],{
		head=BLM_AF_HEAD,
		body=BLM_AF_BODY,
		hands=BLM_AF_HANDS,
		legs=BLM_EMPYREAN_LEGS,
		feet=BLM_AF_FEET,
		waist={ name="Paewr Belt", augments={}},
		right_ring= {name = "Varar Ring", augments={}}
	})

	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})
	
	sets.aftercast.Idle = set_combine(sets.misc.AllJobs['DTCombo'], {
		right_ring={name = "Stikini Ring +1", augments={}},
		right_ear={name = "Moonshade Earring", augments={}},
		body={name = "Sorcerer's Coat +1", augments={}},
		feet={name = "Herald's Gaiters", augments={}},
		waist={name = "Sorcerer's Belt", augments={}},
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

	if sets.BLM.midcast[spell.english] then
		equip(sets.BLM.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.BLM.midcast.Cure)
	end

	if sets.BLM.midcast[spell.skill] then
		equip(sets.BLM.midcast[spell.skill])
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
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end

	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
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
		send_command("gs enable")
		if TPStyle == "Default" then
			TPStyle = "TH"
			equip(sets.aftercast.Engaged[TPStyle])
			send_command("gs disable sub")
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
