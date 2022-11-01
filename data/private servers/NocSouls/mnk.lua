include('organizer-lib')

skillup = 0
showInfo = false

function get_sets()
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
	common_self_command(command)
end

function doSetup()

	equip(sets.aftercast.Idle)

end