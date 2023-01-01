include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.BLM ={}
	sets.BLM.midcast['Elemental Magic'] = {
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
	sets.BLM.midcast['Enfeebling Magic'] = {
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
	sets.BLM.midcast['Dark Magic'] = {
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
	
	sets.BLM.midcast['Healing Magic'] = {
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
	
	sets.BLM.midcast.SorcRing = { left_ring = "Sorcerer's Ring" }
	
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
  	enemyImmunityCheck(spell.target.name,spell.english)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
	commonPrecastRules(sets, spell.english,spell.skill, spell.action_type)
end

function midcast(spell)  
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.BLM.midcast[spell.english] then
		equip(sets.BLM.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.BLM.midcast.Cure)
	end

	if sets.BLM.midcast[spell.skill] then
		equip(sets.BLM.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
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
	common_self_command(command)
end

function doSetup()
	equip(sets.aftercast.Idle)
    send_command('input /macro book 1;wait .1;input /macro set 1')

end