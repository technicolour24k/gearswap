include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.precast = {}
	sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		right_ear="Loquac. Earring",
	}
		
	sets.precast.JobAbility = {}
	sets.precast.JobAbility['Provoke'] = {}
	sets.precast.JobAbility['Yonin'] = {}
	sets.precast.JobAbility['Innin'] = {}
	sets.precast.JobAbility[''] = {}
	sets.precast.JobAbility['Divine Seal'] = {}
	sets.precast.JobAbility['Elemental Seal'] = {}
	sets.precast.JobAbility['Manafont'] = {}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills['Blade: Jin'] = {
		body = "Haubergeon +1",
	}
	
	sets.midcast = {}
	sets.midcast.Wheel = {
	    feet="Garrison Boots",
		neck="Solon Torque",
		left_ear="Moldavite Earring",
		right_ear="Morion Earring +1",
		left_ring="Tamas Ring",
		right_ring="Balrahn's Ring",
	}
	sets.midcast.Wheel['Fire'] = set_combine(sets.midcast.Wheel,{})
	sets.midcast.Wheel['Ice'] = set_combine(sets.midcast.Wheel,{})
	sets.midcast.Wheel['Wind'] = set_combine(sets.midcast.Wheel,{})
	sets.midcast.Wheel['Lightning'] = set_combine(sets.midcast.Wheel,{})
	sets.midcast.Wheel['Water'] = set_combine(sets.midcast.Wheel,{})
	sets.midcast.Wheel['Earth']= set_combine(sets.midcast.Wheel,{})
		
	sets.midcast.Obis = {}
	sets.midcast.Obis.Fire = {}
	sets.midcast.Obis.Lightning = {waist="Rairin Obi"}
	sets.midcast.Obis.Wind = {}
	sets.midcast.Obis.Water = {}
	sets.midcast.Obis.Ice = {}
	sets.midcast.Obis.Earth = {}
	sets.midcast.Obis.Light = {}
	sets.midcast.Obis.Dark = {}
	
	sets.midcast.Haste = {
		waist="Speed Belt",
		feet="Fuma Kyahan"
	}
	
	sets.Engaged = {}
	sets.Engaged.Weapons = {
	    main="Sairen",
		sub="Kabutowari +1",
		ammo="Manji Shuriken"
	}
	sets.Engaged.TP = set_combine(sets.Engaged.Weapons, sets.midcast.Haste, {
	    head="Emperor Hairpin",
		body="Scp. Harness +1",
		hands="Ochiudo's Kote",
		legs="Luisant Brayettes",
		neck="Peacock Charm",
		left_ear="Spike Earring",
		right_ear="Spike Earring",
		left_ring="Rajas Ring",
		right_ring="Toreador's Ring",
		back="Accura Cape +1",
	})
	
	sets.aftercast = {}
	sets.aftercast.Idle = set_combine(sets.Engaged.TP, {
	})
	sets.aftercast.Resting = {
	}
	
	HighAccMobs= S{"Mourning Crawler","Viseclaw"}
	
	NinjaWheel = S{"Katon","Hyuton","Doton","Raiton","Suiton","Huton"}

	doSetup()
end


function precast(spell)
  
  equip(sets.precast.FastCast.Default)

end

function midcast(spell)  
	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	elseif sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	end
	
	if (NinjaWheel:contains(spell.english)) then
		if (sets.midcast.Wheel[spell.element]) then
			equip(sets.midcast.Wheel[spell.element])
		else
			equip(sets.midcast.Wheel)
		end
	end
	
	if string.find(spell.english,'Utsusemi') then 
		equip(sets.midcast.Haste)
	end
	
	
	--Cancel statements
	if spell.english == "Utsusemi: Ichi" then
		cancelBuff("Copy Image*", "3.5")
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.Engaged.TP)
	elseif player.stats == "Idle" then
		equip(sets.aftercast.Idle)
    end
end

function status_change(new,old)
	if new == 'Resting' then
        equip(sets.aftercast.Resting)
	end
	if new == 'Idle' then
		equip(sets.aftercast.Idle)
	end
end

function buff_change(name,gain)
	if name == "Silence" and gain =="true" then
		send_command('@input /item "Echo Drops" <me>')
	elseif ((name == "Disease") or (name == "Plague")) and gain == "true" then
		send_command('@input /item "Tincture" <me>')
	elseif (name == "Doom") and gain == "true" then
		send_command('@input /item "Holy Water" <me>')
	end
end

function self_command(command)
	if command:lower() == "test" then
	
	end
end

function doSetup()
	send_command('gs equip sets.aftercast.Idle')
    send_command('input /macro book 4;wait .1;input /macro set 1')

end

function cancelBuff(buff, delay) --Requires cancel plugin
		send_command('@wait '..delay..'; cancel "'..buff..'"')
		add_to_chat(10, "Cancelling "..buff.." in "..delay.."s...")
end

function weathercheck(spell_element,set, spell)
    if not set then return end
		if spell_element == world.weather_element or spell_element == world.day_element then
			if spell ~= "Stun" then
				add_to_chat(8, ">> Weather or Day element matches spell element <<")
				equip(set, sets.midcast.Obis[spell_element])		
				if spell_element == world.day_element then
					add_to_chat(8, "Equipping Sorcerer's Tonban")
					equip (sets.midcast.SorcPants)
				end
			end
		else
			equip(set)
		end
	
    if set[spell_element] then equip(set[spell_element]) end
end