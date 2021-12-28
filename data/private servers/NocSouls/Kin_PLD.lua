include("organizer-lib")
include("includes/common-functions")
include("includes/config")

showInfo = true
TPStyle = "Sword"
Shield = "Aegis"
local mjob = player.main_job
wsList = S{"Sword", "Great Sword"}


function get_sets()
	include('private servers/'..server..'/common-gearsets')
	init_gear_sets(mjob)

    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    {
		
	}
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{left_ear="Oneiros Earring"})
    sets.precast.Stoneskin = set_combine(sets.precast.FastCast['Enhancing Magic'],{ legs={"Haven Hose"}  })
	
	sets.Enmity= {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Invincible = {}
	sets.precast.JobAbility.Sentinel = { feet="Valor Leggings" }
	sets.precast.JobAbility['Shield Bash'] = { hands = {name="Valor Gauntlets +1" } }
	sets.precast.JobAbility.Cover = {head="Gallant Coronet"}
	sets.precast.JobAbility.Provoke = set_combine(sets.Enmity,{})
	sets.precast.JobAbility.Rampart = { head="Valor Coronet"}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills.default = {}
	sets.precast.WeaponSkills['Requiescat'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Chant du Cygne'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Sanguine Blade'] = set_combine(sets.misc.AllJobsMAB, {})
	sets.precast.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobsMAB, {})
	sets.precast.WeaponSkills['Atonement'] = {}
	sets.precast.WeaponSkills['Knights of Round'] = {}
	sets.precast.WeaponSkills['Resolution'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Torcleaver'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Herculean Slash'] = set_combine(sets.misc.AllJobsMAB, {})
	
    sets.midcast.magic_base = set_combine(sets.misc.AllJobsMAB, {})
	sets.midcast['Healing Magic'] = {}
    sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'], {})
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
		left_ear="Tati Earring",
		right_ear="Tati Earring",
		waist="Windbuffet Belt +1",
		back="Laic Mantle"
	}
	 
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {
		body="Kingdom Aketon",
		neck="Loricate Torque +1"
	})
    
    switchMacroSet(7,1)
	send_command('gs equip sets.aftercast['..player.status..']')
	send_command('input /echo [F9] to toggle weapon types;bind F9 gs c weapon-toggle')
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
		add_to_chat(2, "Dedicated WS Set found")
	else
		if ((spell.action_type == "Ability" ) and (wsList:contains(spell.skill))) then
			equip(sets.precast.WeaponSkills.default)
			add_to_chat(2, "Can't find a dedicated WS set - dropping back to default")
		end
	end

	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
		
	if (string.find(spell.english,'Cur') and spell.english ~='Cursna') then
		equip(sets.precast.Cure)
	end
end

function midcast(spell)
	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        equip(sets.midcast.Cure)
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
end
