include('organizer-lib')

skillup = 0
showInfo = true

function get_sets()
    mp_efficiency = 0
    macc_level = 0
    
	sets.EleStaves = {}
    sets.EleStaves.Fire = {main="Fire Staff"}
    sets.EleStaves.Earth = {main="Earth Staff"}
    sets.EleStaves.Water = {main="Water Staff"}
    sets.EleStaves.Wind = {main="Wind Staff"}
    sets.EleStaves.Ice = {main="Ice Staff"}
    sets.EleStaves.Lightning = {main="Thunder Staff"}
    sets.EleStaves.Light = {main="Light Staff"}
    sets.EleStaves.Dark = {main="Dark Staff"}
	
	sets.DrainAspir = {
	hands="Vampiric Mitts",
	feet="Vampiric Boots"
	}
	
    sets.TH = {

		}
    
    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    {
		left_ear={ name="Loquacious Earring" }
	}
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{   })
	
    sets.precast.Stoneskin = { 
		legs="Haven Hose"
	}
	
    sets.precast.Manafont = {}
    sets.Impact = {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Reward = {ammo="Pet Food Zeta"}

	
    sets.midcast = {}	
	sets.midcast['Elemental Magic'] =     {
		sub="Amicus Grip",
		ammo="Phantom Tathlum",
		head="Warlock's Chapeau",
		body="Justaucorps +1",
		hands="Sly Gauntlets",
		legs="Warlock's Tights",
		feet="Warlock's Boots",
		neck="Philomath Stole",
		waist="Penitent's Rope",
		left_ear="Moldavite Earring",
		right_ear="",
		left_ring="Genius Ring",
		right_ring="Genius Ring",
		back="Black Cape"
	}
	
	sets.midcast.seventyFiveCap = set_combine(sets.midcast.EleMagic, {
	sub={name="Dark Grip"},
	head={ name="Wizard's Petasos" },
	neck={ name="Philomath Stole"},
	legs={ name="Druid's Slops" },
	waist={ name="Penitent's Rope" },
	left_ring={"Genius Ring"},
	right_ring={"Genius Ring"}
	})	
	
    sets.midcast.Death = {    }
	sets.midcast['Dia II'] = sets.TH
    sets.midcast.Dia = sets.TH
    sets.midcast.Bio = sets.TH
    sets.midcast.Diaga = sets.TH
    sets.midcast.Burn = sets.TH
	sets.midcast.Drain = sets.DrainAspir
	sets.midcast.Aspir = sets.DrainAspir
	sets.midcast['Aspir II']= sets.DrainAspir
	
    
    sets.midcast['Dark Magic'] = {
		legs="Wizard's Tonban",
		neck="Dark Torque",
		head="Khthonios Helm"
	}
	
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.EleMagic, {body="Wizard's coat", neck="Spider Torque", head="Igqira Tiara", right_ear="Enfeebling Earring", hands="Teal Cuffs +1"})
    sets.midcast.Vidohunir = {        }
    sets.midcast.Myrkr = {    }
    sets.midcast.Cure = {
		main="Light Staff",
		body="Justaucorps +1",
		hands="Warlock's Gloves",
		feet="Warlock's Boots",
		neck="Promise Badge",
		waist="Penitent's Rope",
		left_ear="",
		right_ear="",
		left_ring="",
		right_ring="",
		back="White Cape"
	}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
    sets.aftercast.Idle = {
		main="Earth Staff",
		body="Vermillion Cloak"
	}
		
    sets.aftercast.Idle['Mana Wall'] = {        }
    
    sets.aftercast.Resting = { 
		main="Dark Staff",
		neck="Grandiose Chain",
		waist="Qiqirn Sash +1",
		legs="Oracle's Braconi"
	}
    sets.aftercast.Engaged = {}
    
    sets.Obis = {}
    sets.Obis.Fire = {waist={name="Karin Obi"}}
    sets.Obis.Earth = {}
    sets.Obis.Water = {waist="Suirin Obi"}
    sets.Obis.Wind = {waist="Furin Obi"}
    sets.Obis.Ice = {waist={name="Hyorin Obi"}}
    sets.Obis.Lightning = {waist="Rairin Obi"}
    sets.Obis.Light = {}
    sets.Obis.Dark = {}
	sets.Obis.SorcPants = {legs="Sorcerer's Tonban"}
    
   
    stuntarg = 'Shantotto'
    send_command('input /macro book 1;wait .1;input /macro set 1')
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Idle')
	
end


function precast(spell)
	
	if showInfo == true then
			--spell info echo
		if spell.type:contains("Magic") then
			add_to_chat(7, '['..spell.english..']:- MP cost: '..spell.mp_cost..' - Target: ' ..spell.target.name.. ' - Element: ' ..spell.element.. ' - Cast Time: ' ..spell.cast_time.. ' - Recast Time: ' ..spell.recast.. ' - Range: ' ..spell.range.. ' - 	Classification: ' ..spell.type.. '/' ..spell.skill.. '')
		end
			--player info echo
			add_to_chat(7, '['..player.name..']:- MP: '..player.mp..' - HP: ' ..player.hp.. ' - TP:  ' ..player.tp..'')
	end

	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	end
    
	if sets.precast[spell.skill] then
		equip(sets.precast[spell.skill])
	end
	if sets.precast[spell.element] then
		equip(sets.precast[spell.element])
	end
	if sets.precast[spell.name] then
		equip(sets.precast[spell.name])
	end
	
end

function midcast(spell)  
	equip(sets.EleStaves[spell.element])
	equip(sets.midcast[spell.skill])
	if sets.midcast[spell.name] then
		equip(sets.midcast[spell.name])
	end
	
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end
    
end

function aftercast(spell)
    if player.status == 'Idle' then
        equip_idle_set()
    elseif sets.aftercast[player.status] then
        equip(sets.aftercast[player.status],sets.aftercast)
    else
        equip(sets.aftercast.Idle,sets.aftercast)
    end
	
    if not spell.interrupted then
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        elseif spell.english == 'Break' or spell.english == 'Breakga' then
            send_command('@wait 25;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        end
    end
	
end

function status_change(new,old)
    if new == 'Resting' then
        equip(sets.aftercast.Resting)
    elseif new == 'Engaged' then
        if not midaction() then
            equip(sets.aftercast.Engaged,sets.aftercast)
        end
    else
    
	equip_idle_set()

    end
    
end

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "cmd" then

	end
end

-- This function is user defined, but never called by GearSwap itself. It's just a user function that's only called from user functions. I wanted to check the weather and equip a weather-based set for some spells, so it made sense to make a function for it instead of replicating the conditional in multiple places.

function weathercheck(spell_element,set)
    if not set then return end
    if spell_element == world.weather_element or spell_element == world.day_element then
		send_command('@input /echo >> Weather or Day element matches spell element <<')
		equip(set, sets.Obis[spell_element])		
		if spell_element == world.day_element then
			equip (sets.Obis.SorcPants)
		end
		
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
end


function equip_idle_set()
    if buffactive['Mana Wall'] then
        equip(sets.aftercast.Idle['Mana Wall'])
    else
        equip(sets.aftercast.Idle)
    end
end
