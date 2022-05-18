include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.EleStaves = {}
	sets.EleStaves.Fire = {	main="Blurred Staff"}
	sets.EleStaves.Lightning = {main = "Blurred Staff"}
	sets.EleStaves.Ice = {main = "Blurred Staff"}
	sets.EleStaves.Wind = {main = "Blurred Staff"}
	sets.EleStaves.Earth = {main = "Blurred Staff"}
	sets.EleStaves.Water = {main = "Blurred Staff"}
	sets.EleStaves.Dark = {main = "Blurred Staff"}
	sets.EleStaves.Light = {main = "Blurred Staff"}
	
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
		ammo="Witchstone",
		head="Spae. Petasos +2",
		body="Wicce Coat",
		hands="Wicce Gloves",
		legs="Spae. Tonban +2",
		feet="Spae. Sabots +2",
		waist="Searing Sash",
		left_ring="Stikini Ring +1",
		right_ring={ name="Safeguard Ring", augments={'HP recovered while healing +4','MP recovered while healing +4','Spell interruption rate down -6%','Occ. inc. resist. to stat. ailments +4',}},
		back="Hecate's Cape"
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
		body="Wicce Coat",
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
    
	equip(sets.EleStaves[spell.element])
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
    send_command('input /macro book 3;wait .1;input /macro set 1')


	send_command('alias buffMe input /ma "Stoneskin" <me>; wait 8; input /ma "Blink" <me>; wait 6; input /ma "Aquaveil" <me>; wait 6; input /ma "Haste" <me>; wait 6; input /ma "Ice Spikes" <me>')	
end