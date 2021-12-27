include('organizer-lib')

skillup = 0
showInfo = true

function get_sets()
    mp_efficiency = 0
    macc_level = 0
    
	sets.EleStaves = {}
    sets.EleStaves.Fire = {main="Fire Staff"}
    sets.EleStaves.Earth = {main="Terra's Staff"}
    sets.EleStaves.Water = {main="Water Staff"}
    sets.EleStaves.Wind = {main="Wind Staff"}
    sets.EleStaves.Ice = {main="Aquilo's Staff"}
    sets.EleStaves.Lightning = {main="Jupiter's Staff"}
    sets.EleStaves.Light = {main="Light Staff"}
    sets.EleStaves.Dark = {main="Pluto's Staff"}
	
	sets.DrainAspir = {
	hands="Vampiric Mitts",
	feet="Vampiric Boots"
	}
	
    sets.TH = {
		left_ear={ name="Phryg. Earring +1", augments={'"Treasure Hunter"+1',}},
		right_ear={ name="Phryg. Earring +1", augments={'"Treasure Hunter"+1',}},
		waist={ name="Sanctuary Obi +1", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},
		left_ring={ name="Keen Ring", augments={'"Treasure Hunter"+1',}},
		right_ring={ name="Heed Ring", augments={'"Treasure Hunter"+1',}},
		legs={ name="Haven Hose", augments={'"Treasure Hunter"+1',}},
		head={ name="Sorcerer's Petasos +2", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},
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
		head="Wizard's Petasos",
		body="Flora Cotehardie",
		hands="Wizard's Gloves",
		legs="Wizard's Tonban",
		feet="Mahant Sandals",
		neck="Philomath Stole",
		waist="Penitent's Rope",
		left_ear="Moldavite Earring",
		right_ear="Phantom Earring",
		left_ring="Zircon Ring",
		right_ring="Zircon Ring",
		back="Black Cape +1"
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
		body="Wizard's Coat",
		hands="Serpentes Cuffs",
		feet="Serpentes Sabots",
		neck="Promise Badge",
		waist="Penitent's Rope",
		left_ear="Valor Earring",
		right_ear="Valor Earring",
		left_ring="Solace Ring",
		right_ring="Solace Ring",
		back="White Cape"
	}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
    sets.aftercast.Idle = {
		main="Terra's Staff",
		body="Vermillion Cloak",
		feet=""
	}
		
    sets.aftercast.Idle['Mana Wall'] = {        }
    
    sets.aftercast.Resting = { 
		main="Pluto's Staff",
		neck="Grandiose Chain",
		waist="Qiqirn Sash +1",
		body="Seer's Tunic",
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
	
	Tier1Spells = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
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
