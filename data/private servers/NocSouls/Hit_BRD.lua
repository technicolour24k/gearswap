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
		left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
	}
	sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast.Default, {})
	
	
	sets.midcast = {}
	sets.midcast['Singing'] = {
		main="Carnwenhan",
		range="Blurred Harp",
		head="Aoidos' Calot +2",
		body="Aoidos' Hngrln. +2",
		hands="Ad. Mnchtte. +2",
		legs="Aoidos' Rhing. +2",
		feet="Aoidos' Cothrn. +2",
		waist="Aoidos' Belt",
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
		
	sets.aftercast = {}
	sets.aftercast.Idle = {
		main = "Earth Staff",
		feet="Aoidos' Cothrn. +2",
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

end

function doSetup()

	send_command('gs equip sets.aftercast.Idle')
    send_command('input /macro book 1;wait .1;input /macro set 1')

end