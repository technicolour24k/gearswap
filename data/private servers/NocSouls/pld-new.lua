include('organizer-lib')

showInfo = true
TPStyle = {"default", "turtle"}
TPStyleIndex = 1
hasteLevel = 4
accuracyLevel = 0

function get_sets()
    sets.TH = {

	}
    
    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    {
		
	}
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{ left_ear="Oneiros Earring" }  )
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
	sets.precast.WeaponSkills['Requiescat'] = {}
	sets.precast.WeaponSkills['Chant du Cygne'] = {}
	sets.precast.WeaponSkills['Sanguine Blade'] = {}
	sets.precast.WeaponSkills['Uriel Blade'] = {
		right_ear = "Moldavite Earring"
	}
	sets.precast.WeaponSkills['Atonement'] = {}
	sets.precast.WeaponSkills['Knights of Round']	= {}
	

	
    sets.midcast = {}
    sets.midcast.magic_base = {	}
	
	sets.midcast['Healing Magic'] = { }
    
    
    sets.midcast.Cure = {	

	}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{ })
    
    sets.aftercast = {}
        
    sets.aftercast.Resting = { }
    sets.aftercast.Engaged = { }
	sets.aftercast.Engaged.SwordShield = {main="Blurred Sword", sub="Steadfast Shield"}
	sets.aftercast.Engaged.default = set_combine(sets.aftercast.Engaged.SwordShield, {
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
	
	--No Accuracy enhancement needed
	sets.aftercast.Engaged.default[0] = set_combine(sets.aftercast.Engaged.default, {}) 
	
	--Light accuracy enhancement needed
	sets.aftercast.Engaged.default[1] = set_combine(sets.aftercast.Engaged.default[0], {
		neck="Ziel Charm",
		left_ear="Tati Earring",
		right_ear="Tati Earring"
	})
	
	--Major accuracy enhancement needed
	sets.aftercast.Engaged.default[2] = set_combine(sets.aftercast.Engaged.default[1], {})
	
	--How did I hit before this?
	sets.aftercast.Engaged.default[3] = set_combine(sets.aftercast.Engaged.default[2], {}) 
	
	sets.aftercast.Engaged.turtle[0] = set_combine(sets.aftercast.Engaged.default[0], {})
	sets.aftercast.Engaged.turtle[1] = set_combine(sets.aftercast.Engaged.turtle[0], {})
	sets.aftercast.Engaged.turtle[2] = set_combine(sets.aftercast.Engaged.turtle[0], {})
	sets.aftercast.Engaged.turtle[3] = set_combine(sets.aftercast.Engaged.turtle[0], {})
    
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
    if player.status == 'Idle' then
        equip_idle_set()
    elseif sets.aftercast[player.status][TPStyle[TPStyleIndex]]accuracyLevel then
        equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]]accuracyLevel,sets.aftercast)
    else
        equip(sets.aftercast.Idle,sets.aftercast)
    end
	
	
	
	if player.hpp < 25 then
		equip(sets.aftercast.Engaged.turtle)
	end
	
end

function status_change(new,old)
    if new == 'Resting' then
        equip(sets.aftercast.Resting)
    elseif new == 'Engaged' then
        if not midaction() then
            equip(sets.aftercast.Engaged.Default,sets.aftercast)
        end
    else
		equip_idle_set()
    end
    
end

function buff_change(name,gol,tab)
	if name=="Doom" then
		--send_command('gs c doomspam')
		while (buffactive['Doom']) do
			send_command('gs c holyWaterSpam')
		end
	end
end

function self_command(command)

	if command:lower() == "attack" then
		TPStyleIndex = 1
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "turtle" then
		TPStyleIndex = 2
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	end
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]])
	else
		equip(sets.aftercast[player.status],sets.aftercast)
	end
	

	
end

-- This function is user defined, but never called by GearSwap itself. It's just a user function that's only called from user functions. I wanted to check the weather and equip a weather-based set for some spells, so it made sense to make a function for it instead of replicating the conditional in multiple places.

function weathercheck(spell_element,set)
    if not set then return end
    if spell_element == world.weather_element or spell_element == world.day_element then
		send_command('@input /echo >> Weather or Day element matches spell element <<')
        equip(set,sets.Obis[spell_element])
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
end


function equip_idle_set()
        equip(sets.aftercast.Idle)
end

function checkForMules()
	i = 1
	ptc = party.count
	zoku_in_party = "no"
	bringer_in_party = "no"
	lohkie_in_party = "no"
	
	while i < ptc+1 do
		if party[i].mob.name == "Zoku" then
			zoku_in_party = "yes"
		elseif party[i].mob.name == "Bringer" then
			bringer_in_party = "yes"
		elseif party[i].mob.name == "Lohkie" then
			lohkie_in_party = "yes"
		end
		i = i+1
	end
end