include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.EleStaves = {}
	sets.EleStaves.Fire = {main = "Fire Staff"}
	sets.EleStaves.Lightning = {main = "Thunder Staff"}
	sets.EleStaves.Ice = {main = "Ice Staff"}
	sets.EleStaves.Wind = {main = "Wind Staff"}
	sets.EleStaves.Earth = {main = "Earth Staff"}
	sets.EleStaves.Water = {main = "Water Staff"}
	sets.EleStaves.Dark = {main = "Dark Staff"}
	sets.EleStaves.Light = {main = "Light Staff"}
	
	sets.precast = {}
	sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		left_ear = "Tranquility Earring +1",
		right_ear = "Stamina Earring +1"
	}
	sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast.Default, {})
	
	
	sets.midcast = {}
	sets.midcast['Elemental Magic'] = {
		head = "Wizard's Petasos",
		neck = "Uggalepih Pendant",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Igqira Weskit",
		hands = "Seer's Mitts +1",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Hecate's Cape",
		waist = "Witch Sash",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	sets.midcast['Enfeebling Magic'] = {
		head = "Wizard's Petasos",
		neck = "Uggalepih Pendant",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Igqira Weskit",
		hands = "Seer's Mitts +1",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Hecate's Cape",
		waist = "Witch Sash",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	sets.midcast['Dark Magic'] = {
		head = "Wizard's Petasos",
		neck = "Uggalepih Pendant",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Igqira Weskit",
		hands = "Seer's Mitts +1",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Hecate's Cape",
		waist = "Witch Sash",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	
	sets.midcast['Healing Magic'] = {
		head = "Wizard's Petasos",
		neck = "Uggalepih Pendant",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Igqira Weskit",
		hands = "Seer's Mitts +1",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Hecate's Cape",
		waist = "Witch Sash",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	
	sets.midcast.SorcRing = { left_ring = "Sorcerer's Ring" }
	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		main = "Earth Staff",
		body="Vermillion Cloak",
		feet="Herald's Gaiters"
	}
	sets.aftercast.Resting = {
		main = "Dark Staff",
		body="Errant Houppelande",
		right_ring = "Safeguard Ring"
	}
	
	doSetup()
	
end


function precast(spell)
  
  equip(sets.precast.FastCast.Default)

end

function midcast(spell)  

	equip(sets.EleStaves[spell.element])
	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	
	if showInfo == 1 then
		infoLog("[Sorcerer's Ring Check] Player HPP: " ..player.hpp.. "%")
	end
	if player.hpp < 75 then
		equip(sets.midcast.SorcRing)
		infoLog("Sorcerer's Ring: Active")
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

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "cmd" then

	end
end

function doSetup()

	send_command('gs equip sets.aftercast.Idle')
    send_command('input /macro book 1;wait .1;input /macro set 1')

end