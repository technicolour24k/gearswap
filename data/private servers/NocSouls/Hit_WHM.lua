include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()

	sets.midcast.Cure = {
		main = "Templar Mace", --Cure 10%
		sub = "Sors Shield", --Cure 3%
		ammo = "Quartz Tathlum +1",
		head = "Theophany Cap +2", --Cure +11% [11% + 0%]
		neck = "Ajari Bead Necklace",
		left_ear = "Roundel Earring", --Cure +5% [16% + 0%]
		body = "Theophany Briault +2", --Cure II +3% [16% + 3%]
		hands = "Theophany Mitts +2", --Cure II +2% [16% + 5%]
		left_ring = "Ephedra Ring",
		right_ring = "Stikini Ring +1",
		back = "Ixion Cape",
		waist = "Witch Sash",
		legs = "Orison Pantaloons +2", --5% Cure amount -> MP
		feet = "Theophany Duckbills +2" 
	}
	sets.midcast.Cursna = {
		main = "Yagrush",
		right_ring = "Ephedra Ring",
		left_ring = "Ephedra Ring"
	}
	sets.midcast.StatFix = {
		main = "Yagrush"
	}
	sets.midcast['Enhancing Magic'] = {
		legs = "Piety Pantaloons +1"
	}
	sets.midcast.Barspells = set_combine(sets.midcast['Enhancing Magic'], { })
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], { })
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], { })
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], { 
		body = "Piety Briault +1",
		hands = "Orison Mitts +2",
		legs = "Theophany Pantaloons +2"
	})
	sets.midcast['Elemental Magic'] = {
		main = "Blurred Staff",
		sub = "Elementa Grip",
		neck = "Lemegeton Medallion",
		body = "Pharmakeia Robe",
		hands = "Weatherspoon Cuffs",	
		right_ring = "Stikini Ring +1",
		back = "Hecate's Cape",
		waist = "Searing Sash",
		legs = "Wicca Subligar",
		feet = "Weatherspoon Souliers"		
	}
	
	sets.aftercast = {}
	sets.aftercast.Idle = set_combine(sets.midcast.Cure, {
		--main = "Earth Staff",
		body = "Theophany Briault +2",
		feet = "Herald's Gaiters",
		right_ring = "Stikini Ring +1"
	})
	sets.aftercast.Engaged = {}

end

	CureSpells = S{	'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Cure V', 'Cure VI',
					'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Curaga V',
					'Cura', 'Cura II', 'Cura III'}

	StatSpells = S{	'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Erase'}
	
	BarSpells = S{	'Barfira', 'Barblizzara', 'Barstonra', 'Baraera', 'Barthundra', 'Barwatera'}
	
	RegenSpells = S{'Regen', 'Regen II', 'Regen III', 'Regen IV'}
	
	

function precast(spell)
	if spell.action_type == 'Magic' then
        equip(sets.common.precast.FastCast.Default)
    end
	
	
end

function midcast(spell)  
    
	if (sets.midcast[spell.english]) then
		equip(sets.midcast[spell.english])
	elseif (sets.midcast[spell.skill]) then
		equip(sets.midcast[spell.skill])
	end
	
	if CureSpells:contains(spell.english) then
		equip(sets.midcast.Cure)
	elseif StatSpells:contains(spell.english) then
		equip(sets.midcast.StatFix)
	elseif BarSpells:contains(spell.english) then
		equip(sets.midcast.Barspells)
	elseif RegenSpells:contains(spell.english) then
		equip(sets.midcast.Regen)
	end
	
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(sets.aftercast.Engaged)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)

end

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "cmd" then

	end
end