include('organizer-lib')

showInfo = true
TPStyle = "Sword"
Shield = "Aegis"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	local mjob = player.main_job
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
	sets.precast.JobAbility.Reward = {ammo="Pet Food Zeta"}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills.default = {}
	sets.precast.WeaponSkills['Requiescat'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Chant du Cygne'] = {}
	sets.precast.WeaponSkills['Sanguine Blade'] = set_combine(sets.misc.AllJobsMAB, {})
	sets.precast.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobsMAB, {})
	sets.precast.WeaponSkills['Atonement'] = {}
	sets.precast.WeaponSkills['Knights of Round']	= {}
	
    sets.midcast.magic_base = set_combine(sets.misc.AllJobsMAB, {})
	sets.midcast['Healing Magic'] = { }
    sets.midcast.Cure = {}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{ })
    
    sets.aftercast = {}
        
    sets.aftercast.Resting = { }
    sets.aftercast.Engaged = { }
	sets.aftercast.Engaged.default = set_combine(sets.Weapons[mjob][TPStyle], {
		ranged="Killer Shortbow",
		head="Rev. Coronet +2",
		body="Rev. Surcoat +2",
		hands="Rev. Gauntlets +2",
		legs="Rev. Breeches +2",
		feet="Chev. Sabatons",
		neck="Twilight Torque",
		left_ear="Tati Earring",
		right_ear="Tati Earring",
		waist="Dynamic Belt +1",
		back="Metallon Mantle"
	})
	 
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Default, {neck="Twilight Torque"})
	
    sets.Obis = {}
    
    send_command('input /macro book 7;wait .1;input /macro set 1')
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Engaged.Default')
	send_command('gs equip sets.aftercast.Engaged.SwordShield')
	send_command('input /echo [F10] Bound to Accuracy level toggle;bind F10 gs c acctoggle')
	send_command('input /echo [F11] Bound to Set Attack heavy TP Gear;bind F11 gs c attack')
	send_command('input /echo [F12] Bound to Set Defense heavy TP Gear;bind F12 gs c turtle')
	
	disable('main','sub')
end


function precast(spell)

	if ((config.showSpellInfo == true) or (showInfo == true)) then
		add_to_chat(12, "Action: "..spell.english.." | Action Type: "..spell.action_type.." | MP Cost: "..spell.mp_cost.." | TP Cost: "..spell.tp_cost)
	end

	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	end

	if sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	else
		equip(sets.precast.WeaponSkills.default)
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
	if (player.status == "Idle") then 
		equipGearByState("sets.aftercast[player.status]", true)
	else
		equipGearByState("sets.aftercast[player.status][TPStyle]", false)
	end
end

function status_change(new,old)
    if new == 'Resting' then
        equip(sets.aftercast.Resting)
    else
		if (player.status == "Idle") then 
			equipGearByState("sets.aftercast[player.status]", true)
		else
			equipGearByState("sets.aftercast[player.status][TPStyle]", false)
		end
	end
    
end

function self_command(command)
	if command:lower() == "weapon-toggle" then
		if (TPStyle == "Sword") then
			TPStyle = "Great Sword"
		else
			TPStyle = "Sword"
		end
		add_to_chat(8,"TP Style is now: " ..TPStyle)
		if (player.status == "Idle") then 
			equipGearByState("sets.aftercast[player.status]", true)
		else
			equipGearByState("sets.aftercast[player.status][TPStyle]", false)
		end
	end
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]])
	else
		equip(sets.aftercast[player.status],sets.aftercast)
	end
end