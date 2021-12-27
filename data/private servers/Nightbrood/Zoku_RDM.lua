include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.EleStaves = {}
	sets.EleStaves.Fire = {main="Chatoyant Staff"}
	sets.EleStaves.Lightning = {main = "Chatoyant Staff"}
	sets.EleStaves.Ice = {main = "Chatoyant Staff"}
	sets.EleStaves.Wind = {main = "Chatoyant Staff"}
	sets.EleStaves.Earth = {main = "Chatoyant Staff"}
	sets.EleStaves.Water = {main = "Chatoyant Staff"}
	sets.EleStaves.Dark = {main = "Chatoyant Staff"}
	sets.EleStaves.Light = {main = "Chatoyant Staff"}
	
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
	sets.precast.JobAbility['Divine Seal'] = {}
	sets.precast.JobAbility['Elemental Seal'] = {}
	sets.precast.JobAbility['Convert'] = {}
	sets.precast.JobAbility['Chainspell'] = {}
	sets.precast.JobAbility['Composure'] = {}
	
	sets.precast.WeaponSkills = {}
	sets.precast.Engaged = {
		main="Blau Dolch",
		sub="Misericorde +1",
		head="Warlock's Chapeau",
		body="Dalmatica +1",
		hands="Dusk Gloves +1",
		legs="Blood Cuisses",
		feet="Karasutengu",
		neck="Peacock Charm",
		waist="Speed Belt",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Toreador's Ring",
		right_ring="Toreador's Ring",
		back="Umbra Cape"
	}
	
	sets.midcast = {}
	sets.midcast['Elemental Magic'] = {
		ammo="Phtm. Tathlum",
		head="Cobra Hat",
		body="Blue Cotehard. +1",
		hands="Sly Gauntlets",
		legs="Ogre Trousers +1",
		feet="River Gaiters",
		neck="Elemental Torque",
		waist="Penitent's Rope",
		left_ear="Morion Earring +1",
		right_ear="Moldavite Earring",
		left_ring="Genius Ring",
		right_ring="Genius Ring",
		back="Red Cape +1",
	}
	
	sets.midcast['Elemental Magic'].HighAcc = set_combine(sets.midcast['Elemental Magic'], {
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
		sub="Raptor Strap +1",
		ammo="Phtm. Tathlum",
		head="Warlock's Chapeau",
		body="Mahatma Hpl.",
		hands="Devotee's Mitts +1",
		legs="Mahatma Slops",
		feet="Mahatma Pigaches",
		neck="Promise Badge",
		waist="Witch Sash",
		left_ear="Celestial Earring",
		right_ear="Incubus Earring +1",
		left_ring="Tamas Ring",
		right_ring="Balrahn's Ring",
		back="Dew Silk Cape +1",
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
		neck="Aesir Torque",
		left_ear="Incubus Earring +1",
		right_ear="Incubus Earring +1",
		left_ring="Galdr Ring",
		right_ring="Balrahn's Ring",
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
	    sub="Raptor Strap +1",
		head="Warlock's Chapeau",
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
		sub="Bugard Strap +1",
		ammo="White Tathlum",
		body="Mahatma Hpl.",
		legs="Mahatma Slops",
		neck="Enhancing Torque",
		waist="Penitent's Rope",
		left_ear="Loquac. Earring",
		right_ear="Augment. Earring",
		left_ring="Karka Ring",
		right_ring="Balrahn's Ring",
		back="Ixion Cape"
	}
	
	sets.midcast.Obis = {}
	sets.midcast.Obis.Fire = {}
	sets.midcast.Obis.Lightning = {}
	sets.midcast.Obis.Wind = {}
	sets.midcast.Obis.Water = {}
	sets.midcast.Obis.Ice = {}
	sets.midcast.Obis.Earth = {}
	sets.midcast.Obis.Light = {}
	sets.midcast.Obis.Dark = {}

	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		main="Earth Staff",
		body="Vermillion Cloak",
		right_ring="Balrahn's Ring",
		back="Umbra Cape",
		hands="empty",
		legs="Blood Cuisses"
	}
	sets.aftercast.Resting = {
		main="Chatoyant Staff",
		neck="Grandiose Chain",
		left_ear="Rapture Earring",
		body="Mahatma Hpl.",
		waist="Hierarch Belt",
		back="Invigorating Cape",
	}
	
	HighAccMobs= S{"Mourning Crawler","Viseclaw", "NPC"}

	doSetup()
end


function precast(spell)
  
  equip(sets.precast.FastCast.Default)

end

function midcast(spell)  
	equip(sets.EleStaves[spell.element])
	--send_command("input /equipset 1")
	if sets.midcast[spell.skill][spell.element] then
		weathercheck(spell.element, sets.midcast[spell.skill][spell.element])
	elseif sets.midcast[spell.skill] then
		weathercheck(spell.element, sets.midcast[spell.skill])
	end

	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	elseif sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	end
	
	if (HighAccMobs:contains(spell.target.name)) then
		if sets.midcast[spell.skill]['HighAcc'] then
			add_to_chat(9, "High Accuracy Target: Equipping more MAcc")
			weathercheck(spell.element,sets.midcast[spell.skill]['HighAcc'])
		end
	end
	
	if spell.english == "Stoneskin" then
		cancelBuff("Stoneskin", "3")
	end
	if spell.english == "Ice Spikes" then
		cancelBuff("Ice Spikes", "1.5")
	end
	
	
end

function aftercast(spell)
	if player.status == 'Idle' then
		equip(sets.aftercast.Idle)
    end
	if player.status == 'Engaged' then
		equip(sets.precast.Engaged)
	end
end

function status_change(new,old)
	if new == 'Resting' then
        equip(sets.aftercast.Resting)
	end
	if new == 'Idle' then
		equip(sets.aftercast.Idle)
	end
	if new == 'Engaged' then
		equip(sets.precast.Engaged)
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
	if command:lower() == "colourtest" then
		local i=0
		while i < 256 do
			add_to_chat(i, "Colour Check: " ..i)
			i=i+1
		end

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

function weathercheck(spell_element,set)
    if not set then return end
    if spell_element == world.weather_element or spell_element == world.day_element then
		add_to_chat(8, ">> Weather or Day element matches spell element <<")
		equip(set, sets.midcast.Obis[spell_element])		
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
end