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
	local mjob = player.main_job
	init_gear_sets(mjob)
	
	sets.TH = {
		sub = "Sandung",
		hands = "Plun. Armlets +1",
		feet = "Skulk. Poulaines +1"
	}
	sets.MAB = set_combine(sets.misc.AllJobsMAB, {
		head="Wayfarer Circlet",
		waist = "Aquiline Belt",
		legs = "Limbo Trousers"
	})
	sets.JobAbility["Perfect Dodge"] = {}
	sets.JobAbility["Sneak Attack"] = {}
	sets.JobAbility["Trick Attack"] = {}
	sets.JobAbility.Flee = {feet = "Pillager's Poulaines +3"}
	sets.JobAbility.Accomplice = {head = {name = "Skulker's Bonnet"}}
	sets.JobAbility.Collaborator = {head = {name = "Skulker's Bonnet"}}

	sets.WeaponSkills["Dancing Edge"] = {}
	sets.WeaponSkills["Mercy Stroke"] = {}
	sets.WeaponSkills["Mandalic Stab"] = {}
	sets.WeaponSkills["Rudra's Storm"] = set_combine(sets.WeaponSkills['Fotia'],{
		ammo = "Floestone",
		head = "Skulker's Bonnet +1",
		body = "Pillager's Vest +3",
		hands = "Pill. Armlets +3",
		legs = "Skulk. Culottes +1",
		feet = "Plun. Poulaines +1",
		neck = "Tlamiztli collar",
		back = "Canny Cape",
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
		left_ring = "Regal Ring",
		right_ring = "Epona's Ring"
	})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.MAB,{})
	sets.WeaponSkills["Exenterator"] = {}

	sets.midcast.Cure = {}

	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]["Daggers"],{
		ammo={ name="Yetshila +1", augments={'"Triple Atk."+2','"Triple Atk."+2','Crit.hit rate+5','Crit.hit rate+5',}},
		head="Pill. Bonnet +3",
		body="Skulker's Vest +1",
		hands="Pill. Armlets +3",
		legs="Skulk. Culottes +1",
		feet="Savateur's Gaiters",
		neck="Loricate Torque +1",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear={ name="Telos Earring" },
		right_ear={ name="Tati Earring" },
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
		back={ name="Laic Mantle", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
	})

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged[TPStyle],{
		left_ring = "Defending Ring",
		right_ring = "Stikini Ring +1",
		feet = "Pillager's Poulaines +3",
		neck="Loricate Torque +1",
		left_ear = "Moonshade Earring"
	})

	switchMacroSet(8, 1)
	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
	send_command("input /echo [F9] Bound to Toggle TP Gear;bind F9 gs c togglegear")
	send_command("input /echo [F12] Bound to status removal;bind F12 gs c status-check")
	--send_command('input /echo >> Need to finish SA/TA buff rules!! <<)

	disable("main", "sub")
end

function precast(spell)
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
		add_to_chat(1, "Looks like a cure!")
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
end

function aftercast(spell)
	if (buffactive['Sneak Attack'] == 1) and (buffactive['Trick Attack'] == 1)  then
		add_to_chat(8, "<< SATA Active >>")
		equip(set_combine(sets.precast["Sneak Attack"], sets.precast['Trick Attack']))
	elseif (buffactive['Sneak Attack'] == 1) then
		add_to_chat(8, "<< Sneak Attack Active >>")
		equip(sets.precast["Sneak Attack"])
	elseif (buffactive['Trick Attack'] == 1) then
		add_to_chat(8, "<< Trick Attack Active >>")
		equip(sets.precast["Trick Attack"])
	else
		if player.status == "Engaged" then
			equip(sets.aftercast[player.status][TPStyle])
		else
			equip(sets.aftercast[player.status])
		end
	end
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
			send_command("gs disable sub")
		elseif TPStyle == "TH" then
			TPStyle = "Accuracy"
		elseif TPStyle == "Accuracy" then
			TPStyle = "Evasion"
		else
			TPStyle="Default"
		end
		add_to_chat(8, "TP Style is now: " .. TPStyle.. "!")
		equip(sets.aftercast.Engaged[TPStyle])
	end

	if command:lower() == "status-check" then
		if (config.oneClickRemedies) then
			clearStatuses()
		end
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end

end