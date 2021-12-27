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
		head = "Warlock's Chapeau",
		body = "Duelist's Tabard +2",
		left_ear = "Tranquility Earring +1",
		right_ear = "Stamina Earring +1"
	}
	sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast.Default, {})
	sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast.Default, {})
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility['Composure'] = {
		head = "Estoqueur's Chappel +2",
		body = "Estoqueur's Sayon +2",
		hands = "Estoqueur's Gantherots+2",
		legs = "Estoqueur's Fuseau +2",
		feet = "Estoqueur's Houseaux +2"
	}
	
	
	sets.midcast = {}
	sets.midcast['Elemental Magic'] = {
		head="Estq. Chappel +2",
		body="Estq. Sayon +2",
		hands="Dls. Gloves +2",
		legs="Estqr. Fuseau +2",
		feet="Duelist's Boots +2",
		neck="Uggalepih Pendant",
		waist="Witch Sash",
		--left_ear = "Sortiarius Earring",
		right_ear="Moldavite Earring",
		left_ring="Genius Ring",
		right_ring="Genius Ring",
		back="Hecate's Cape"
	}
	sets.midcast['Enfeebling Magic'] = {
		head = "Warlock's Chapeau",
		neck = "Philomath Stole",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Flora Cotehardie",
		hands = "Sly Gauntlets",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Red Cape +1",
		waist = "Penitent's Rope",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	sets.midcast['Dark Magic'] = {
		head = "Warlock's Chapeau",
		neck = "Philomath Stole",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Flora Cotehardie",
		hands = "Sly Gauntlets",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Red Cape +1",
		waist = "Penitent's Rope",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	
	sets.midcast['Healing Magic'] = {
		head = "Warlock's Chapeau",
		neck = "Philomath Stole",
		left_ear = "Moldavite Earring",
		right_ear = "Stamina Earring +1",
		body = "Flora Cotehardie",
		hands = "Sly Gauntlets",
		left_ring = "Genius Ring",
		right_ring = "Genius Ring",
		back="Red Cape +1",
		waist = "Penitent's Rope",
		legs = "Mage's Slacks",
		feet="Mountain Gaiters"		
	}
	
	sets.midcast['Enhancing Magic'] = {
		head = "Warlock's Chapeau",
		body = "Duelist's Tabard +2",
		hands = "Duelist's Gloves +2",
		legs = "Warlock's Tights"
	}
	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		main = "Earth Staff",
		head = "Duelist's Chapeau +2",
		body="Estoqueur's Sayon +2",
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
	send_command('input /macro book 2;wait .1;input /macro set 1')
	
	setupAliases()
end

function setupAliases()	
	send_command('alias buffMe input /ma "Stoneskin" <me>; wait 6; input /ma "Blink" <me>; wait 6; input /ma "Aquaveil" <me>; wait 6; input /ma "Refresh II" <me>; wait 6; input /ma "Haste II" <me>; wait 6; input /ma "Phalanx" <me>;wait 6; input /ma "Ice Spikes" <me>')	
end