include("organizer-lib")
include("includes/common-functions")
include("includes/config")

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80
local waltzTier = ""
TPStyle = "Default"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	local mjob = player.main_job
	init_gear_sets(mjob)
	
	sets.MAB = set_combine(sets.misc.AllJobsMAB, {
		head="Wayfarer Circlet",
		legs = "Limbo Trousers"
	})
	sets.JobAbility["Trance"] = {}
	sets.JobAbility["Sambas"] = {head=DNC_AF_HEAD}
	sets.JobAbility["Drain Samba"] = set_combine(sets.JobAbility['Sambas'], {})
	sets.JobAbility["Drain Samba II"] = set_combine(sets.JobAbility['Sambas'], {})
	sets.JobAbility["Drain Samba III"] = set_combine(sets.JobAbility['Sambas'], {})
	sets.JobAbility["Aspir Samba"] = set_combine(sets.JobAbility['Sambas'], {})
	sets.JobAbility["Aspir Samba II"] = set_combine(sets.JobAbility['Sambas'], {})
	sets.JobAbility["Haste Samba"] = set_combine(sets.JobAbility['Sambas'], {})

	sets.JobAbility["Waltzes"] = {
		head=DNC_RELIC_HEAD,
		body=DNC_AF_BODY,
		feet=DNC_AF_FEET,
		neck="Cerulean Pendant",
		right_ring="Asklepian Ring",
		left_ring = "Valaseur's Ring"
	}
	sets.JobAbility["Curing Waltz"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Curing Waltz II"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Curing Waltz III"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Curing Waltz IV"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Curing Waltz V"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Divine Waltz"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Divine Waltz II"] = set_combine(sets.JobAbility['Waltzes'], {})
	sets.JobAbility["Healing Waltz"] = set_combine(sets.JobAbility['Waltzes'], {})

	sets.JobAbility['Jigs'] = {feet=DNC_AF_FEET}
	sets.JobAbility["Chocobo Jig"] = set_combine(sets.JobAbility['Jigs'], {})
	sets.JobAbility["Chocobo Jig II"] = set_combine(sets.JobAbility['Jigs'], {})
	sets.JobAbility["Spectral Jig"] = set_combine(sets.JobAbility['Jigs'], {})

	sets.JobAbility['Steps'] = {
		head=DNC_AF_HEAD,
		hands=DNC_AF_HANDS
	}
	sets.JobAbility["Quickstep"] = set_combine(sets.JobAbility['Steps'], {})
	sets.JobAbility["Box Step"] = set_combine(sets.JobAbility['Steps'], {})
	sets.JobAbility["Stutter Step"] = set_combine(sets.JobAbility['Steps'], {})
	sets.JobAbility["Feather Step"] = set_combine(sets.JobAbility['Steps'], {
		feet=DNC_EMPYREAN_FEET
	})

	sets.JobAbility['Flourishes'] = {}
	sets.JobAbility["Animated Flourish"] = set_combine(sets.JobAbility['Flourishes'], {})
	sets.JobAbility["Desperate Flourish"] = set_combine(sets.JobAbility['Flourishes'], {})
	sets.JobAbility["Violent Flourish"] = set_combine(sets.JobAbility['Flourishes'], {})
	sets.JobAbility["Reverse Flourish"] = set_combine(sets.JobAbility['Flourishes'], {
		hands=DNC_EMPYREAN_HANDS
	})
	sets.JobAbility["Building Flourish"] = set_combine(sets.JobAbility['Flourishes'], {})
	sets.JobAbility["Wild Flourish"] = set_combine(sets.JobAbility['Flourishes'], {})
	sets.JobAbility["Climactic Flourish"] = set_combine(sets.JobAbility['Flourishes'], {
		head=DNC_EMPYREAN_HEAD
	})
	sets.JobAbility["Striking Flourish"] = set_combine(sets.JobAbility['Flourishes'], {
		body=DNC_EMPYREAN_BODY
	})
	sets.JobAbility["Ternary Flourish"] = set_combine(sets.JobAbility['Flourishes'], {})

	sets.JobAbility["Saber Dance"] = {}
	sets.JobAbility["Fan Dance"] = {}
	sets.JobAbility["No Foot Rise"] = {}
	sets.JobAbility["Presto"] = {}
	sets.JobAbility["Grand Pas"] = {}
	sets.JobAbility["Contradance"] = {}
	
	
	sets.WeaponSkills["Dancing Edge"] = {}
	sets.WeaponSkills["Pyrrhic Kleos"] = {}
	sets.WeaponSkills["Rudra's Storm"] = set_combine(sets.WeaponSkills['Fotia'],{
		ammo = "Floestone",
		head=DNC_EMPYREAN_HEAD,
		body=DNC_EMPYREAN_BODY,
		hands=DNC_EMPYREAN_HANDS,
		legs=DNC_AF_LEGS,
		feet=DNC_EMPYREAN_FEET,
		neck = "Tlamiztli collar",
		back = "Laic Mantle",
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
		head=DNC_EMPYREAN_HEAD,
		body=DNC_EMPYREAN_BODY,
		hands=DNC_EMPYREAN_HANDS,
		legs=DNC_EMPYREAN_LEGS,
		feet="Savateur's Gaiters", -- cap subtle blow with Maculele Casaque +1 - 30 Subtle Blow augment
		neck="Loricate Torque +1",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear={ name="Telos Earring" },
		right_ear={ name="Tati Earring" },
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
		back={ name="Laic Mantle", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
	})

	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged[TPStyle],{
		left_ring = "Defending Ring",
		right_ring = "Stikini Ring +1",
		feet = "Tandava Crackows",
		neck="Loricate Torque +1",
		left_ear = "Moonshade Earring"
	})

	switchMacroSet(14, 1)
	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
	send_command("input /echo [F9] Bound to Toggle TP Gear;bind F9 gs c togglegear")
	send_command("input /echo [F12] Bound to status removal;bind F12 gs c status-check")

	disable("main", "sub")
end

function precast(spell)
	--JA buff cancelling
	if (spellContains(spell.english, "Spectral Jig")) then
		cancelBuff(spell.english, spell.cast_time, FastCast, "Sneak", spell.type)
	end

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
	elseif spellContains(spell.english,'Cure') or spellContains(spell.english,'Cura') then 
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
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
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
	
end

function area_change(new,old)

end

function self_command(command)
	if command:lower() == "togglegear" then
		send_command("gs enable sub")
		if TPStyle == "Default" then
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

	if command:lower() == "waltzing" then
		if (player.last_subtarget.hpp < 50) then
			waltzTier = "Curing Waltz V"
		elseif (player.last_subtarget.hpp < 60) then
			waltzTier = "Curing Waltz IV"
		elseif (player.last_subtarget.hpp < 70) then
			waltzTier = "Curing Waltz III"
		elseif (player.last_subtarget.hpp < 80) then
			waltzTier = "Curing Waltz II"
		else
			waltzTier = "Curing Waltz"
		end
		--add_to_chat(12, "HP: "..player.last_subtarget.hpp.." - Using "..waltzTier.." on "..player.last_subtarget.name)
		send_command('input /ja "'..waltzTier..'" '..player.last_subtarget.name..'')
		--add_to_chat(39,'input /ja "'..waltzTier..'" '..player.last_subtarget.name..'')
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end

end