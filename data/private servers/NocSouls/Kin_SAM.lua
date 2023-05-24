include("organizer-lib")
include("includes/common-functions")
include("includes/config")

showInfo = false
TPStyle = "Great Katana" -- Amanomurakumo: 481TP/swing as base 99 SAM
local mjob = player.main_job
wsList = S{"Great Katana"}


function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	init_gear_sets(mjob)
	sets.SAM = {}
	sets.JobAbility = {}
	sets.JobAbility['Meditate'] = {
		head = "Wakido Kabuto +2",
		hands = "Sakonji Kote +1"
	}
	sets.JobAbility['Sekkanoki'] = {
		hands = "Unkai Kote +2"
	}
	sets.JobAbility['Hasso'] = {
		body = "Wakido Kote +2",
		legs = "Unkai Haidate +2",
		feet = "Wakido Sune-Ate +2"
	}
	sets.JobAbility['Seigan'] = {
		head = "Unkai Kabuto +2",
	}
	sets.JobAbility['Third Eye'] = {
		head = "Sakonji Haidate +1",
	}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills.default = set_combine(sets.aftercast.Engaged,{
		neck="Ire Torque",
		waist="Chuq'aba Belt",
		feet="Sakonji Sune-Ate +1",
		left_ring="Ifrit Ring"
	})
	sets.precast.WeaponSkills['Tachi: Fudo'] = set_combine(sets.WeaponSkills.default, {})
	sets.precast.WeaponSkills['Tachi: Shoha'] = set_combine(sets.WeaponSkills.default, {})
	sets.precast.WeaponSkills['Tachi: Kaiten'] = set_combine(sets.WeaponSkills.default, {})
	sets.precast.WeaponSkills['Tachi: Ageha'] = set_combine(sets.WeaponSkills.default, {})
	sets.precast.WeaponSkills['Apex Arrow'] = set_combine(sets.WeaponSkills.default, {})	

	sets.SAM.midcast = {}
    sets.SAM.midcast.MAB = set_combine(sets.misc.AllJobs.MAB, {})
	sets.SAM.midcast['Healing Magic'] = {}
    sets.SAM.midcast.Cure = set_combine(sets.SAM.midcast['Healing Magic'], {})
    sets.SAM.midcast.EnhancingDuration = {}
    sets.SAM.midcast.Stoneskin = set_combine(sets.SAM.midcast.EnhancingDuration,{ })
    sets.SAM.midcast.Aquaveil = set_combine(sets.SAM.midcast.EnhancingDuration,{ })
    sets.SAM.midcast.Refresh = set_combine(sets.SAM.midcast.EnhancingDuration,{ })
    sets.SAM.midcast.Phalanx = set_combine(sets.SAM.midcast.EnhancingDuration,{ })
     
    sets.aftercast.Resting = { }
	sets.aftercast.Engaged = {
		head="Wakido Kabuto +2",
		body="Wakido Domaru +2",
		hands="Wakido Kote +2",
		legs="Wakido Haidate +2",
		feet="Wakido Sune. +2",
		neck="Tlamiztli Collar",
		left_ear="Telos Earring",
		right_ear="Mache Earring +1",
		left_ring = "Rajas Ring",
		right_ring = "Regal Ring",
		waist="Windbuffet Belt +1",
		back="Laic Mantle"
	}
	 
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {
		neck="Loricate Torque +1",
		left_ring = "Defending Ring",
		right_ring = "Patricius Ring",
		left_ear = "Moonshade Earring"
	})
    
	equip(sets.aftercast[player.status])
	infoLog('[F9] to toggle weapon types')
end


function precast(spell)
	if ((config.showSpellInfo == true) or (showInfo == true)) then
		infoLog("Action: "..spell.english.." | Action Type: "..spell.action_type.."/"..spell.skill.." | MP Cost: "..spell.mp_cost.." | TP Cost: "..spell.tp_cost)
	end

	if sets.JobAbility[spell.english] then
		equip(sets.JobAbility[spell.english])
	end

	if sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	else
		if ((spell.action_type == "Ability" ) and (wsList:contains(spell.skill))) then
			equip(sets.precast.WeaponSkills.default)
		end
	end

	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
	
	if ((spell.english == "Seigan") or (spell.english == "Hasso")) or ((buffactive['Seigan']==1) or (buffactive['Hasso']==1)) then	
		FastCast = 50
	elseif (not (spell.english == "Seigan") or (spell.english == "Hasso")) and ((buffactive['Seigan']==nil) and (buffactive['Hasso']==nil)) then	
		FastCast = 80
	end

	if spell.action_type == "Magic" then
		equip(sets.common.precast.FastCast.Default)
	end

	if spell.action_type == "Ability" then
		cancelBuff(spell.english, 0,0)
	end
end

function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.SAM.midcast[spell.english] then
		equip(sets.SAM.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.SAM.midcast.Cure)
	end

	if sets.SAM.midcast[spell.skill] then
		equip(sets.SAM.midcast[spell.skill])
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
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
end

function status_change(new,old)
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
end

function self_command(command)
	if command:lower() == "weapon-toggle" then
		if (TPStyle == "Great Katana") then
			TPStyle = "Polearm"
		elseif (TPStyle == "Polearm") then
			TPStyle = "Archery"
		else
			TPStyle = "Great Katana"
		end
		infoLog("TP Style is now: " ..TPStyle)
		equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
	end
	common_self_command(command)
end
