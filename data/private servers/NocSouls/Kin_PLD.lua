include("organizer-lib")
include("includes/common-functions")
include("includes/config")

showInfo = false
TPStyle = "Sword"
local mjob = player.main_job
wsList = S{"Sword", "Great Sword"}
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	init_gear_sets(mjob)

	sets.PLD={}
	sets.Enmity= {}
	sets.PLD.midcast = {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Invincible = {}
	sets.precast.JobAbility.Sentinel = { feet="Cab. Leggings +1" }
	sets.precast.JobAbility['Shield Bash'] = { hands = "Cab. Gauntlets +1" }
	sets.precast.JobAbility.Cover = {head=PLD_AF_HEAD}
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
	sets.precast.WeaponSkills['Sanguine Blade'] = set_combine( {})
	sets.precast.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobs.MAB, {})
	-- Standard mods
	sets.precast.WeaponSkills['Savage Blade'] = set_combine(sets.WeaponSkills['AllJobsWS'],{ --50% STR, 50% MND - Equal footing for both
		head=PLD_AF_HEAD,
		body=PLD_AF_BODY,
		hands=PLD_AF_HANDS,
		legs=PLD_AF_LEGS,
		feet=PLD_AF_FEET,
		neck="Ire Torque",
		waist="Chuq'aba Belt",
		left_ear="Aqua Pearl",
		right_ear="Aqua Pearl",
		back="Laic Mantle",
	})
	sets.precast.WeaponSkills['Knights of Round'] = {}
	sets.precast.WeaponSkills['Resolution'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Torcleaver'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Herculean Slash'] = set_combine(sets.misc.AllJobs.MAB, {})
	
    sets.PLD.midcast.MAB = set_combine(sets.misc.AllJobs.MAB, {})
	sets.PLD.midcast['Healing Magic'] = {}
    sets.PLD.midcast.Cure = set_combine(sets.common.midcast['Healing Magic'], {
		left_ear="Oneiros Earring",
		right_ear="Hospitaler Earring",
		back = "Fierabras's Mantle",
		left_ring = "Asklepian Ring"
	})
    sets.PLD.midcast.Stoneskin = set_combine(sets.common.midcast.EnhancingDuration,{ })
    sets.PLD.midcast.Aquaveil = set_combine(sets.common.midcast.EnhancingDuration,{ })
    sets.PLD.midcast.Refresh = set_combine(sets.common.midcast.EnhancingDuration,{ })
    sets.PLD.midcast.Phalanx = set_combine(sets.common.midcast.EnhancingDuration,{ })
	sets.PLD.midcast.Reprisal = set_combine(sets.common.midcast.EnhancingDuration,{
		sub = "Adamas"
	})
     
    sets.aftercast.Resting = { }
	sets.aftercast.Engaged = set_combine(sets.misc.AllJobs.TP, {
		ammo= empty,
		ranged="Killer Shortbow",
		head=PLD_AF_HEAD,
		body=PLD_AF_BODY,
		hands=PLD_AF_HANDS,
		legs=PLD_AF_LEGS,
		feet=PLD_RELIC_FEET,
		neck="Loricate Torque +1",
		waist = "Nierenschutz",
	})
	 
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {
		legs = "Crimson Cuisses",
		left_ring = "Defending Ring",
		right_ring = "Stikini Ring +1",
		left_ear = "Moonshade Earring",
	})
    
    switchMacroSet(7,1)
	equip(sets.aftercast[player.status])
	infoLog('[F9] to toggle weapon types')
	infoLog("[F12] Bound to status removal")
end

function pretarget(spell)
	confirmTarget(spell.skill,spell.target.type)
	equipPreviousGear("set")

end

function precast(spell)
	if ((config.showSpellInfo == true) or (showInfo == true)) then
		infoLog("Action: "..spell.english.." | Action Type: "..spell.action_type.."/"..spell.skill.." | MP Cost: "..spell.mp_cost.." | TP Cost: "..spell.tp_cost)
	end
		
	enemyImmunityCheck(spell.target.name,spell.english)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
	commonPrecastRules(sets, spell.english,spell.skill, spell.action_type)
end

function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.PLD.midcast[spell.english] then
		equip(sets.PLD.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.PLD.midcast.Cure)
	end

	if sets.PLD.midcast[spell.skill] then
		equip(sets.PLD.midcast[spell.skill])
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
	commonAftercastRules(sets, spell.english,spell.skill, spell.action_type)
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
	equipPreviousGear("equip")
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
		infoLog("TP Style is now: " ..TPStyle)
		equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
	end
	common_self_command(command)
end
