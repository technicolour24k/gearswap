include('organizer-lib')

showInfo = true
TPStyle = {"Default", "TH", "Accuracy", "Evasion"}
TPStyleIndex = 1

function get_sets()

	
    sets.TH = {
		left_ear={ name="Phryg. Earring +1", augments={'"Treasure Hunter"+1',}},
		right_ear={ name="Phryg. Earring +1", augments={'"Treasure Hunter"+1',}},
		right_ring={ name="Heed Ring", augments={'"Treasure Hunter"+1',}},
	}
    
    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    {
		ammo={ name="Kilo Fan", augments={'"Fast Cast"+2',}}, 
		head={ name="Silver Hairpin", augments={'"Fast Cast"+2',}}, 
		hands={ name="Garrison Gloves", augments={'"Fast Cast"+2',}},
		legs={ name="Garrison Hose", augments={'"Fast Cast"+2',}}, 
		neck={ name="Bloodbead Amulet", augments={'"Fast Cast"+2',}}, 
		waist={ name="Staff Belt", augments={'"Fast Cast"+2',}},
		left_ear={ name="Beetle Earring", augments={'"Fast Cast"+2',}}, 
		right_ear={ name="Beetle Earring", augments={'"Fast Cast"+2',}}, 
		left_ring={ name="Protean Ring", augments={'"Fast Cast"+2',}},
		right_ring={ name="Protean Ring", augments={'"Fast Cast"+2',}}, 
		back={ name="Mercen. Mantle", augments={'"Fast Cast"+2',}}
	}
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{ head={name="Aegishjalmr"}   })
    sets.precast.Stoneskin = set_combine(sets.precast.FastCast['Enhancing Magic'],{ legs={"Haven Hose"}  })
    
	
	sets.precast['Utsusemi: Ichi']= set_combine(sets.precast.FastCast.Default, {})
	sets.precast['Utsusemi: Ni']= set_combine(sets.precast.FastCast.Default, {})
		
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Invincible = {}
	sets.precast.JobAbility.Sentinel = {}
	sets.precast.JobAbility['Sneak Attack'] = { ammo="Fortune Egg", head="Emperor Hairpin", neck="Spike Necklace", left_ear="Pixie Earring", right_ear="Pennon Earring", left_ring="Zilant Ring", hands="Andvaranauts", body="Assassin's Vest", back="Commander's Cape", waist="Cuchulain's Belt", legs="Enkidu's Subligar", feet="Enkidu's Leggings"}
	sets.precast.JobAbility['Trick Attack'] = { ammo="Fortune Egg", head="Emperor Hairpin", left_ear="Pennon Earring",right_ear="Pennon Earring", hands="Assassin's Armlets +1", body="Assassin's Vest", back="Commander's Cape", waist="Crudelis Belt", legs="Enkidu's Subligar", feet="Enkidu's Leggings"}
	sets.precast.JobAbility.Flee = { }
	sets.precast.JobAbility.Rampart = { }
	sets.precast.JobAbility.Reward = {ammo="Pet Food Zeta"}
	sets.precast.JobAbility.Accomplice = { head={ name="Raider's Bonnet +1" } }
	sets.precast.JobAbility.Collaborator = { head={ name="Raider's Bonnet +1" } }
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills['Dancing Edge'] = { neck="Spike Necklace", right_ear="Pixie Earring", waist="Vanguard Belt"}
	sets.precast.WeaponSkills['Mercy Stroke'] = { head="Patroclus's Helm", right_ear="Giant's Earring", hands="Alkyoneus's Bracelets", }
	sets.precast.WeaponSkills['Rudra\'s Storm'] = {right_ear="Pixie Earring", neck="Spike Necklace", left_ring="Zilant Ring", back="Commander's Cape", waist="Cuchulain's Belt"}
	sets.precast.WeaponSkills['Exenterator'] = {}
	
    sets.midcast = {}

	sets.midcast['Ninjutsu'] = { }
   
    sets.midcast.Cure = {	}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{ legs="Haven Hose" })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
        
    sets.aftercast.Resting = { }
    sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.MainDagger = {
		main={ name="Mandau", augments={'Attack+10','"Dbl.Atk."+1','Haste+2','STR+6'}}
	}
	
	sets.aftercast.Engaged.OffHandDagger = {
		sub={ name="Mandau", augments={'Attack+10','"Dbl.Atk."+1','Haste+2','DEX+4'}}
	}
	
	--sets.aftercast.Engaged.Daggers = set_combine(sets.aftercast.Engaged.MainDagger, sets.aftercast.Engaged.OffHandDagger)
	
	sets.aftercast.Engaged.Default = set_combine(sets.aftercast.Engaged.Daggers, {
		main={ name="Mandau", augments={'Attack+10','"Dbl.Atk."+1','Haste+2','STR+6'}},
		ammo={ name="Happy Egg", augments={'DMG:+4','Haste+4','System: 1 ID: 132 Val: 3','"Store TP"+4 "Subtle Blow"+4',}},
		head={ name="Raider's Bonnet +1" },
		body="Raider's Vest +1",
		hands="Andvaranauts",
		legs="Enkidu's Subligar",
		feet="Enkidu's Leggings",
		neck="Peacock Amulet",
		waist="Velocious Belt",
		left_ear="Waetoto's Earring",
		right_ear="Coral Earring",
		left_ring="Toreador's Ring",
		right_ring="Toreador's Ring",
		back={ name="Atheling Mantle"},
		})
		
	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion= set_combine(sets.aftercast.Engaged.Default, {head="Emperor Hairpin", right_ear="Evasion Earring"})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged[TPStyle[TPStyleIndex]], {left_ring="Jelly Ring", right_ring="Succor Ring"})
	
    sets.Obis = {}

    
    send_command('input /macro book 3;wait .1;input /macro set 1')
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Engaged.Default')
	send_command('gs equip sets.aftercast.Engaged.OffHandDagger')
	send_command('input /echo [F9] Bound to Default TP Gear;bind F9 gs c default')
	send_command('input /echo [F10] Bound to Set TH based TP Gear;bind F10 gs c th')
	send_command('input /echo [F11] Bound to Set Accuracy heavy TP Gear;bind F11 gs c accuracy')
	send_command('input /echo [F12] Bound to Set Evasion heavy TP Gear;bind F12 gs c evasion')
	send_command('input /echo [Ctrl+F1] Bound to T3 Nukes on mules;bind ^F1 gs c mulet3nukes')
	send_command('input /echo [Ctrl+F2] Bound to T2 Nukes on mules;bind ^F2 gs c mulet2nukes')
	send_command('input /echo [Ctrl+A] Bound to rest on mules;bind !a gs c mymulerest')
	--send_command('input /echo >> Need to finish SA/TA buff rules!! <<)
	
	equip(sets.aftercast.Engaged.OffHandDagger)
	disable('main','sub')
end


function precast(spell)

add_to_chat(8, player.equipment.main)

	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	end

	if sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	end


	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
		
	checkForMules()
	
	if spell.english:contains("Cure") then
		if zoku_in_party == "yes" then
			send_command('send Zoku /ma '..spell.english.. ' ' ..spell.target.name..'')
		end
	end
	
end
function midcast(spell)
	
	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        equip(sets.midcast.Cure)
	end

	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
end

function aftercast(spell)

	
	if spell.english == "Sneak Attack" then
		add_to_chat(8, "Yayyy!")
		equip (sets.precast['Sneak Attack'])
	elseif spell.english == "Trick Attack" then
		add_to_chat(8, "Yay!")
		equip (sets.precast['Trick Attack'])
	else
		if player.status == 'Idle' then
			equip_idle_set()
		elseif sets.aftercast[player.status][TPStyle[TPStyleIndex]] then
			equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]],sets.aftercast)
		else
			equip(sets.aftercast.Idle,sets.aftercast)
		end
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

function buff_change(name,gain)

--add_to_chat(8, name)
--add_to_chat(9, tostring(gain))
--add_to_chat(8, player.status.. " - " ..TPStyle[TPStyleIndex])

	if name == "Trick Attack" and gain == "false" then
			equip(sets.aftercast.Idle,sets.aftercast)
	elseif name == "Sneak Attack" and gain == "false" then
		if player.status == 'Idle' then
			equip_idle_set()
		elseif sets.aftercast[player.status][TPStyle[TPStyleIndex]] then
			equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]],sets.aftercast)
		else
			equip(sets.aftercast.Idle,sets.aftercast)
		end
	end
end

function self_command(command)

	if command:lower() == "mulet3nukes" then
		checkForMules()
		add_to_chat(9, ">> T3 Nukes")
		if zoku_in_party == "yes" then
			send_command('send Zoku gs c t3nukes')
		end
		if bringer_in_party == "yes" then
			send_command('send Bringer gs c t3nukes')
		end
		if bringer_in_party=="no" and zoku_in_party=="no" then
			add_to_chat(8, "No mule found.")
		end
	elseif command:lower() == "mulet2nukes" then
	checkForMules()
	add_to_chat(9, ">> T2 Nukes")
		if zoku_in_party == "yes" then
			send_command('send Zoku gs c t2nukes')
		end
		if bringer_in_party == "yes" then
			send_command('send Bringer gs c t2nukes')
		end
		if bringer_in_party=="no" and zoku_in_party=="no" then
			add_to_chat(8, "No mule found.")
		end
	elseif command:lower() == "mymulerest" then
	checkForMules()
		if zoku_in_party == "yes" then
			send_command('send Zoku gs c restup')
			add_to_chat(8, "Resting Zoku!")
		end
		if bringer_in_party == "yes" then
			send_command('send Zoku gs c restup')
		end
		if bringer_in_party=="no" and zoku_in_party=="no" then
			add_to_chat(8, "No mule found.")
		end
	end
	

	if command:lower() == "default" then
		TPStyleIndex = 1
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "th" then
		TPStyleIndex = 2		
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "accuracy" then
		TPStyleIndex = 3
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "evasion" then
		TPStyleIndex = 4
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
	
	while i < ptc+1 do
		if party[i].mob.name == "Zoku" then
			zoku_in_party = "yes"
		elseif party[i].mob.name == "Bringer" then
			bringer_in_party = "yes"
		end
		i = i+1
	end
end