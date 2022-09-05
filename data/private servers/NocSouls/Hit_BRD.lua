include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.BRD = {}
	sets.BRD.midcast['Singing'] = {
		main="Carnwenhan",
		range="Blurred Harp",
		head="Aoidos' Calot +2",
		body="Aoidos' Hngrln. +2",
		hands="Ad. Mnchtte. +2",
		legs="Aoidos' Rhing. +2",
		feet="Aoidos' Cothrn. +2",
		waist="Aoidos' Belt",
	}

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
	equip(sets.common.precast.FastCast.Default)
end

function midcast(spell)  
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.BRD.midcast[spell.english] then
		equip(sets.BRD.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        -- equip(sets.BRD.midcast.Cure)
	end

	if sets.BRD.midcast[spell.skill] then
		equip(sets.BRD.midcast[spell.skill])
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

end

function doSetup()

	send_command('gs equip sets.aftercast.Idle')
    send_command('input /macro book 1;wait .1;input /macro set 1')

end