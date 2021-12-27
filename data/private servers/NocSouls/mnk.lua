include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
	sets.precast = {}
	sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		left_ear = "Tranquility Earring +1",
		right_ear = "Stamina Earring +1"
	}

	sets.midcast = {}
	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		feet="Herald's Gaiters"
	}
	
	sets.aftercast.Resting = {
		main = "Dark Staff",
		body="Errant Houppelande",
		right_ring = "Safeguard Ring"
	}
	
	sets.JobAbility = {}
	sets.JobAbility['Focus'] = {}
	
	sets.Engaged = {}
	sets.Engaged.Default = {}
	
	sets.WeaponSkills = {}
	sets.WeaponSkills['Victory Smite'] = {}
	
	doSetup()
	
end
function precast(spell)

	if (sets.JobAbility[spell.english]) then
		equip(sets.JobAbility[spell.english])
	end
	
	if (sets.WeaponSkills[spell.english]) then
		equip(sets.JobAbility[spell.english])
	end


end

function midcast(spell)  

end

function aftercast(spell)

	if player.status_change == "Engaged" then
		equip(sets.Engaged.Default)
	else
		equip(sets.aftercast.Idle)
	end

end

function pet_midcast(spell)

end


function pet_aftercast(spell)

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