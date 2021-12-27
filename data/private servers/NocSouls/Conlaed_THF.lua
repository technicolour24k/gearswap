include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()

	sets.precast = {}
	sets.precast.default = {}
	sets.precast.Cure = set_combine(sets.precast.default, {})
	
	
	sets.midcast = {}
	sets.midcast.WeaponSkills = {}
	sets.midcast.WeaponSkills.default = {}
	sets.midcast.WeaponSkills['Rudra\'s Storm'] = {
	    main={ name="Sandung", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		sub="Mandau",
		ammo={ name="Yetshila +1", augments={'Crit.hit rate+5','Crit.hit rate+5','Crit.hit rate+5','Crit.hit rate+5',}},
		head="Pill. Bonnet +3",
		body="Pillager's Vest +3",
		hands="Plun. Armlets +1",
		legs="Pill. Culottes +3",
		feet="Pill. Poulaines +2",
		neck={ name="Asperity Necklace", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		waist="Chaac Belt",
		left_ear="Mache Earring +1",
		right_ear={ name="Mache Earring +1", augments={'Attack+18','Attack+18','Accuracy+18','Accuracy+18',}},
		left_ring={ name="Epona's Ring", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		right_ring={ name="Keen Ring", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		back={ name="Vassal's Mantle", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},	
	}
	
	
	sets.aftercast = {}
	sets.aftercast.Engaged = {
		main={ name="Sandung", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		sub="Mandau",
		ammo={ name="Yetshila +1", augments={'Crit.hit rate+5','Crit.hit rate+5','Crit.hit rate+5','Crit.hit rate+5',}},
		head="Pill. Bonnet +3",
		body="Pillager's Vest +3",
		hands="Plun. Armlets +1",
		legs="Pill. Culottes +3",
		feet="Pill. Poulaines +2",
		neck={ name="Asperity Necklace", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		left_ear="Mache Earring +1",
		right_ear={ name="Mache Earring +1", augments={'Attack+18','Attack+18','Accuracy+18','Accuracy+18',}},
		left_ring={ name="Epona's Ring", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		right_ring={ name="Keen Ring", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
		back={ name="Vassal's Mantle", augments={'"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3','"Triple Atk."+3',}},
	}

	doSetup()
	
end


	
	

function precast(spell)
	
	
	
end

function midcast(spell)  
    
	if (sets.midcast.WeaponSkills[spell.english]) then
		equip(sets.midcast.WeaponSkills[spell.english])
	else
		equip(sets.midcast.WeaponSkills.default)
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

function doSetup()

	send_command('gs equip sets.aftercast.Engaged')
	send_command('input /macro book 1;wait .1;input /macro set 1')

	setupAliases()
end

function setupAliases()	
	send_command('alias buffMe input /ma "Stoneskin" <me>; wait 6; input /ma "Blink" <me>; wait 6; input /ma "Aquaveil" <me>; wait 6; input /ma "Refresh II" <me>; wait 6; input /ma "Haste II" <me>; wait 6; input /ma "Phalanx" <me>;wait 6; input /ma "Ice Spikes" <me>')	
end