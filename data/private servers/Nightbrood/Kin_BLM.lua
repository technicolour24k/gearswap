include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.precast = {}
	sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		right_ear="Loquac. Earring",
	}
	sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default, {})
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility['Steal'] = {}
	sets.precast.JobAbility['Mug'] = {}
	sets.precast.JobAbility['Flee'] = {}
	sets.precast.JobAbility['Sneak Attack'] = {}
	sets.precast.JobAbility['Divine Seal'] = {}
	sets.precast.JobAbility['Elemental Seal'] = {}
	sets.precast.JobAbility['Manafont'] = {}
	
	sets.precast.WeaponSkills = {}
	
	sets.midcast = {}
	sets.midcast['Elemental Magic'] = {
		main="Laevateinn",
		sub="Bugard Strap +1",
		ammo="Phtm. Tathlum",
		head="Morrigan's Coronal",
		body="Morrigan's Robe",
		hands="Morrigan's Cuffs",
		legs="Morrigan's Slops",
		feet="Morrigan's Pigaches",
		neck="Uggalepih Pendant",
		waist="Salire Belt",
		left_ear="Novio Earring",
		right_ear="Moldavite Earring",
		left_ring="Tamas Ring",
		right_ring="Galdr Ring",
		back="Hecate's Cape"
	}
	
	sets.midcast['Elemental Magic'].HighAcc = set_combine(sets.midcast['Elemental Magic'], {
		hands="Wizard's Gloves",
		neck="Aesir Torque",
	})
	sets.midcast['Elemental Magic'].Fire = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Lightning = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Ice = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Wind = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Water = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Earth = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Light = set_combine(sets.midcast['Elemental Magic'],{})
	sets.midcast['Elemental Magic'].Dark = set_combine(sets.midcast['Elemental Magic'],{})
	
	sets.midcast['Enfeebling Magic'] = {
		main="Laevateinn",
		sub="Bugard Strap +1",
		ammo="Phtm. Tathlum",
		head="Genie Tiara",
		body="Wizard's Coat",
		hands="Zenith Mitts +1",
		legs="Genie Lappas",
		feet="Mountain Gaiters",
		neck="Enfeebling Torque",
		waist="Salire Belt",
		left_ear="Incubus Earring +1",
		right_ear="Incubus Earring +1",
		left_ring="Balrahn's Ring",
		right_ring="Karka Ring",
		back="Hecate's Cape"	
	}
	sets.midcast['Enfeebling Magic'].Fire = set_combine(sets.midcast['Enfeebling Magic'],{})
	sets.midcast['Enfeebling Magic'].Lightning = set_combine(sets.midcast['Enfeebling Magic'],{})
	sets.midcast['Enfeebling Magic'].Ice = set_combine(sets.midcast['Enfeebling Magic'],{sub = "Ice Grip"})
	sets.midcast['Enfeebling Magic'].Wind = set_combine(sets.midcast['Enfeebling Magic'],{sub = "Wind Grip"})
	sets.midcast['Enfeebling Magic'].Water = set_combine(sets.midcast['Enfeebling Magic'],{})
	sets.midcast['Enfeebling Magic'].Earth = set_combine(sets.midcast['Enfeebling Magic'],{sub = "Earth Grip"})
	sets.midcast['Enfeebling Magic'].Light = set_combine(sets.midcast['Enfeebling Magic'],{})
	sets.midcast['Enfeebling Magic'].Dark = set_combine(sets.midcast['Enfeebling Magic'],{sub = "Dark Grip"})
	
	sets.midcast['Dark Magic'] = {
		main="Laevateinn",
		feet="Genie Huaraches",
		neck="Aesir Torque",
		left_ear="Incubus Earring +1",
		right_ear="Incubus Earring +1",
		left_ring="Galdr Ring",
		right_ring="Balrahn's Ring",
		legs="Wizard's Tonban",
	}
	
	sets.midcast['Dark Magic'].Fire = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Lightning = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Ice = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Wind = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Water = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Earth = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Light = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Dark = set_combine(sets.midcast['Dark Magic'],{sub = "Dark Grip"})

	
	sets.midcast['Healing Magic'] = {
		main="Chatoyant Staff",
	    sub="Raptor Strap +1",
		head="Morrigan's Coronal",
		body="Mahatma Houppelande",
		hands="Devotee's Mitts +1",
		legs="Mahatma Slops",
		feet="Mahatma Pigaches",
		neck="Fylgja Torque +1",
		waist="Penitent's Rope",
		left_ear="Celestial Earring",
		right_ear="Roundel Earring",
		left_ring="Tamas Ring",
		right_ring="Balrahn's Ring",
		back="Dew Silk Cape +1",
	}
	
	sets.midcast['Enhancing Magic'] = {
		main="Laevateinn",
		sub="Bugard Strap +1",
		ammo="Phtm. Tathlum",
		head="Morrigan's Coronal",
		body="Mahatma Hpl.",
		hands="Zenith Mitts +1",
		legs="Mahatma Slops",
		feet="Genie Huaraches",
		neck="Enhancing Torque",
		waist="Witch Sash",
		left_ear="Loquac. Earring",
		right_ear="Augment. Earring",
		left_ring="Karka Ring",
		right_ring="Balrahn's Ring",
		back="Ixion Cape"
	}
	
	sets.midcast['Stun'] = set_combine(sets.midcast['Dark Magic'], {
		waist = "Ninurta's Sash",
	})
	
	sets.midcast.SorcRing = { left_ring = "Sorcerer's Ring" }
	sets.midcast.SorcPants = {legs="Sorcerer's Tonban"}
	
	sets.midcast.Obis = {}
	sets.midcast.Obis.Fire = {}
	sets.midcast.Obis.Lightning = {waist="Rairin Obi"}
	sets.midcast.Obis.Wind = {}
	sets.midcast.Obis.Water = {}
	sets.midcast.Obis.Ice = {}
	sets.midcast.Obis.Earth = {}
	sets.midcast.Obis.Light = {}
	sets.midcast.Obis.Dark = {}

	
	sets.aftercast = {}
	sets.aftercast.Idle = set_combine(sets.midcast['Elemental Magic'],{
		main="Earth Staff",
		feet="Herald's Gaiters",
		left_ear="Sorcerer's Earring",
		right_ring="Balrahn's Ring",
		back="Umbra Cape"
	})
	sets.aftercast.Resting = {
		main="Laevateinn",
		neck="Grandiose Chain",
		left_ear="Rapture Earring",
		body="Mahatma Hpl.",
		waist="Hierarch Belt",
		back="Invigorating Cape",
	}
	
	HighAccMobs= S{"Mourning Crawler","Viseclaw"}

	doSetup()
end


function precast(spell)
  
  equip(sets.precast.FastCast.Default)

end

function midcast(spell)  
	if (spell.action_type == 'Magic') then
		if sets.midcast[spell.english] then
			weathercheck(spell.element, sets.midcast[spell.english], spell.english)

		elseif sets.midcast[spell.skill][spell.element] then
			weathercheck(spell.element, sets.midcast[spell.skill][spell.element], spell.english)
		elseif sets.midcast[spell.skill] then
			weathercheck(spell.element, sets.midcast[spell.skill], spell.english)
		end
	end
	
	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	elseif sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	end
	
	if showInfo == 1 then
		add_to_chat(8, "[Sorcerer's Ring Check] Player HPP: " ..player.hpp.. "%")
	end
	if (HighAccMobs:contains(spell.target.name)) then
		if sets.midcast[spell.skill]['HighAcc'] then
			add_to_chat(9, "High Accuracy Target: Equipping more MAcc")
			weathercheck(spell.element,sets.midcast[spell.skill]['HighAcc'])
		end
	end
	
	--Cancel statements
	if player.hpp < 75 then
		equip(sets.midcast.SorcRing)
		add_to_chat(8, "Sorcerer's Ring: Active")
	end
	
	if spell.english == "Stoneskin" then
		cancelBuff("Stoneskin", "3.5")
	end
end

function aftercast(spell)
	if player.status == 'Idle' then
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
	if name == "Silence" and gain =="True" then
		send_command('@input /item "Echo Drops" <me>')
	elseif ((name == "Disease") or (name == "Plague")) and gain == "True" then
		send_command('@input /item "Tincture" <me>')
	end
end

function self_command(command)
	if command:lower() == "test" then
	
	end
end

function doSetup()
	send_command('gs equip sets.aftercast.Idle')
    send_command('input /macro book 1;wait .1;input /macro set 1')

end

function cancelBuff(buff, delay) --Requires cancel plugin
		send_command('@wait '..delay..'; cancel '..buff)
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