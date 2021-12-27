include('organizer-lib')

showInfo = true
TPStyle = {"Default", "Attack", "Accuracy", "Turtle"}
TPStyleIndex = 1

function get_sets()

	
    sets.TH = {	}
    
    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    { }
    sets.precast.FastCast['Ninjutsu'] = set_combine(sets.precast.FastCast.Default,{   })
	
	sets.Enmity= {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility['Aspir Samba II'] = {head = "Dancer's Tiara"}
	sets.precast.JobAbility['Drain Samba III'] = {head = "Dancer's Tiara"}
	sets.precast.JobAbility['Haste Samba'] = {head = "Dancer's Tiara"}
	sets.precast.JobAbility.WaltzBase = {left_ear="Roundel Earring", body="Dancer's Casaque"}
	sets.precast.JobAbility['Curing Waltz III'] = set_combine(sets.precast.JobAbility.WaltzBase,{})
	sets.precast.JobAbility['Curing Waltz IV'] = set_combine(sets.precast.JobAbility.WaltzBase,{})
	sets.precast.JobAbility['Curing Waltz V'] = set_combine(sets.precast.JobAbility.WaltzBase,{})
	sets.precast.JobAbility['Divine Waltz'] = set_combine(sets.precast.JobAbility.WaltzBase,{})
	sets.precast.JobAbility['Divine Waltz II'] = set_combine(sets.precast.JobAbility.WaltzBase,{})
	sets.precast.JobAbility['Healing Waltz'] = set_combine(sets.precast.JobAbility.WaltzBase,{})
	sets.precast.JobAbility['Chocobo Jig'] = {feet="Dancer's Shoes"}
	sets.precast.JobAbility['Chocobo Jig II'] = {feet="Dancer's Shoes"}
	sets.precast.JobAbility['Spectral Jig'] = {feet="Dancer's Shoes"}
	sets.precast.JobAbility['Box Step'] = {}
	sets.precast.JobAbility['Stutter Step'] = {}
	sets.precast.JobAbility['Feather Step'] = {}
	sets.precast.JobAbility['Quickstep'] = {}
	sets.precast.JobAbility.FlourishBase = {}
	sets.precast.JobAbility['Violent Flourish'] = set_combine(sets.precast.JobAbility.FlourishBase,{body="Etoile Casaque +2"})
	sets.precast.JobAbility['Reverse Flourish'] = set_combine(sets.precast.JobAbility.FlourishBase,{hands="Charis Bangles +1"})
	sets.precast.JobAbility['Climactic Flourish'] = set_combine(sets.precast.JobAbility.FlourishBase,{})
	sets.precast.JobAbility['Striking Flourish'] = set_combine(sets.precast.JobAbility.FlourishBase,{})
	sets.precast.JobAbility['*Flourish*'] = set_combine(sets.precast.JobAbility.FlourishBase,{})
	sets.precast.JobAbility['Saber Dance'] = {}
	sets.precast.JobAbility['Fan Dance'] = {}
	sets.precast.JobAbility['No Foot Rise'] = {body="Etoile Casaque +2"}
	sets.precast.JobAbility['Presto'] = {}
	sets.precast.JobAbility['Grand Pas'] = {}
	sets.precast.JobAbility['Contradance'] = {}
		
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills.WSBase = {neck="Agasaya's Collar", right_ear="Pixie Earring", legs="Tumbler Trunks"}
	sets.precast.WeaponSkills['Exenterator'] = set_combine(sets.precast.WeaponSkills.WSBase,{})
	sets.precast.WeaponSkills['Evisceration'] = set_combine(sets.precast.WeaponSkills.WSBase,{})
	sets.precast.WeaponSkills['Aeolian Edge'] = set_combine(sets.precast.WeaponSkills.WSBase,{})
	

	
    sets.midcast = {}
	sets.midcast['Ninjutsu'] = set_combine(sets.precast.FastCast['Ninjutsu'], sets.precast.FastCast.Default, {})
    
    
    sets.aftercast = {}
        
    sets.aftercast.Resting = {}
    sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Daggers = {main="Eminent Dagger", sub="Aluh Jambiya"}
	sets.aftercast.Engaged.Default = set_combine(sets.aftercast.Engaged.Daggers, {
		ammo={name="Potestas Bomblet"},
		head={ name="Espial Cap"},
		body={name="Espial Gambison"},
		hands={name="Espial Bracers"},
		legs={name="Espial Hose"},
		feet={name="Espial Socks"},
		neck={name="Charis Necklace"},
		waist={name="Twilight Belt"},
		left_ear={name="Brutal Earring"},
		right_ear={name="Suppanomimi"},
		left_ring={name="Rajas Ring"},
		right_ring={name="Epona's Ring"},
		back={ name="Atheling Mantle"}
	})
	sets.aftercast.Engaged.Attack = set_combine(sets.aftercast.Engaged.Default, {head="Dancer's Tiara"})
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})
    
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Default, {	left_ring="Jelly Ring", feet="Tandava Crackows"})

    --Reset macro books
    send_command('input /macro book 2;wait .1;input /macro set 1')
	
	--Setup gearswap character gear
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Idle')
	send_command('gs equip sets.aftercast.Engaged.Daggers')
	
	--Setup key bindings
	send_command('clearbinds')
	send_command('exec windower-bindings.txt')
	send_command('exec '..player.name..'_'..player.main_job..'-bindings.txt')
	
	--Don't want gearswap to accidently switch out my weapons!
	disable('main','sub')
	
end


function precast(spell)

	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	end

	if sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	end

	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	else
		equip(sets.precast.FastCast.Default)
	end
	
	if spell.english == "Spectral Jig" then
		send_command(cancel 'sneak')
	end
	
end


function midcast(spell)
	
	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end

end

function aftercast(spell)
    if player.status == 'Idle' then
        equip_idle_set()
    elseif sets.aftercast[player.status][TPStyle[TPStyleIndex]] then
        equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]],sets.aftercast)
    else
        equip(sets.aftercast.Idle,sets.aftercast)
    end

	
end

function status_change(new,old)
    if new == 'Resting' then
        equip(sets.aftercast.Resting)
    elseif new == 'Engaged' then
        if not midaction() then
            equip(sets.aftercast.Engaged.Default,sets.aftercast)
        end
    else
		equip_idle_set()
    end
    
end

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "default" then
		TPStyleIndex = 1
	elseif command:lower() == "attack" then
		TPStyleIndex = 2		
	elseif command:lower() == "accuracy" then
		TPStyleIndex = 3
	elseif command:lower() == "evasion" then
		TPStyleIndex = 4
	end
	add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
	equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]])
	else
		equip(sets.aftercast[player.status],sets.aftercast)
	end
	
end

-- This function is user defined, but never called by GearSwap itself. It's just a user function that's only called from user functions. I wanted to check the weather and equip a weather-based set for some spells, so it made sense to make a function for it instead of replicating the conditional in multiple places.

function weathercheck(spell_element,set)
    if not set then return end
    if spell_element == world.weather_element or spell_element == world.day_element then
		send_command('@input /echo >> Weather or Day element matches spell element <<')
        equip(set,sets.Obis[spell_element])
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
end


function equip_idle_set()
        equip(sets.aftercast.Idle)
end
