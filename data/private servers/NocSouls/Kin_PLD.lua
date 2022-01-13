include("organizer-lib")
include("includes/common-functions")
include("includes/config")

showInfo = false
TPStyle = "Sword"
local mjob = player.main_job
wsList = S{"Sword", "Great Sword"}


function get_sets()
	include('private servers/'..server..'/common-gearsets')
	init_gear_sets(mjob)

	sets.Enmity= {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Invincible = {}
	sets.precast.JobAbility.Sentinel = { feet="Cab. Leggings +1" }
	sets.precast.JobAbility['Shield Bash'] = { hands = "Cab. Gauntlets +1" }
	sets.precast.JobAbility.Cover = {head="Rev. Coronet +3"}
	sets.precast.JobAbility.Provoke = set_combine(sets.Enmity,{})
	sets.precast.JobAbility.Rampart = { head="Cab. Coronet +1"}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills.default = {}
	--FTP Replicating WS
	sets.precast.WeaponSkills['Requiescat'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Chant du Cygne'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Swift Blade'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Vorpal Blade'] = set_combine(sets.WeaponSkills['Fotia'], {})
	-- MAB modded WS
	sets.precast.WeaponSkills['Sanguine Blade'] = set_combine(sets.misc.AllJobsMAB, {})
	sets.precast.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobsMAB, {})
	-- Standard mods
	sets.precast.WeaponSkills['Savage Blade'] = set_combine(sets.WeaponSkills.default,{ --50% STR, 50% MND - Equal footing for both
		head="Rev. Coronet +3",
		body="Rev. Surcoat +3",
		hands="Rev. Gauntlets +3",
		legs="Rev. Breeches +3",
		feet="Rev. Leggings +3",
		neck="Ire Torque",
		waist="Chuq'aba Belt",
		left_ear="Aqua Pearl",
		right_ear="Aqua Pearl",
		left_ring="Regal Ring",
		right_ring="Stikini Ring +1",
		back="Laic Mantle",
	})
	sets.precast.WeaponSkills['Knights of Round'] = {}
	sets.precast.WeaponSkills['Resolution'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Torcleaver'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Herculean Slash'] = set_combine(sets.misc.AllJobsMAB, {})
	
    sets.midcast.magic_base = set_combine(sets.misc.AllJobsMAB, {})
	sets.midcast['Healing Magic'] = {}
    sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'], {
		left_ear="Oneiros Earring",
		right_ear="Hospitaler Earring",
		back = "Fierabras's Mantle",
		left_ring = "Asklepian Ring"
	})
    sets.midcast.EnhancingDuration = {}
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{ })
	sets.midcast.Reprisal = set_combine(sets.midcast.EnhancingDuration,{
		sub = "Adamas"
	})
     
    sets.aftercast.Resting = { }
	sets.aftercast.Engaged = {
		ranged="Killer Shortbow",
		head="Rev. Coronet +3",
		body="Rev. Surcoat +3",
		hands="Rev. Gauntlets +3",
		legs="Rev. Breeches +3",
		feet="Chev. Sabatons",
		neck="Loricate Torque +1",
		left_ear="Telos Earring",
		right_ear="Mache Earring +1",
		left_ring = "Defending Ring",
		right_ring = "Regal Ring",
		waist="Windbuffet Belt +1",
		back="Laic Mantle"
	}
	 
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {
		body = "Cab. Surcoat +1",
		legs = "Crimson Cuisses",
		neck="Loricate Torque +1",
		left_ring = "Defending Ring",
		right_ring = "Stikini Ring +1",
		left_ear = "Moonshade Earring",
		waist = "Nierenschutz",
		back = "Weard Mantle"
	})
    
    switchMacroSet(7,1)
	send_command('gs equip sets.aftercast['..player.status..']')
	send_command('input /echo [F9] to toggle weapon types;bind F9 gs c weapon-toggle')
	send_command("input /echo [F12] Bound to status removal;bind F12 gs c status-check")
end


function precast(spell)
	if ((config.showSpellInfo == true) or (showInfo == true)) then
		add_to_chat(12, "Action: "..spell.english.." | Action Type: "..spell.action_type.."/"..spell.skill.." | MP Cost: "..spell.mp_cost.." | TP Cost: "..spell.tp_cost)
	end

	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
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
		
	if spell.action_type == "Magic" then
		equip(sets.precast.FastCast.Default)
	end
end

function midcast(spell)
	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.midcast.Cure)
		add_to_chat(1, "Looks like a cure!")
	end
end

function aftercast(spell)
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
end

function status_change(new,old)
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
end

function self_command(command)
	if command:lower() == "weapon-toggle" then
		if (TPStyle == "Sword") then
			TPStyle = "Great Sword"
		else
			TPStyle = "Sword"
		end
		add_to_chat(28,"TP Style is now: " ..TPStyle)
		equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
	end

	if command:lower() == "status-check" then
		if (config.oneClickRemedies) then
			clearStatuses()
		end
	end
end
