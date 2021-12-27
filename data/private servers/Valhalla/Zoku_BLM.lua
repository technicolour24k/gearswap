include('organizer-lib')

skillup = 0
showInfo = false
t3delay = 7
t2delay = 4


function get_sets()
    mp_efficiency = 0
    macc_level = 0
    
	sets.EleStaves = {}
    sets.EleStaves.Fire = {main="Laevateinn"}
    sets.EleStaves.Earth = {main="Laevateinn"}
    sets.EleStaves.Water = {main="Laevateinn"}
    sets.EleStaves.Wind = {main="Laevateinn"}
    sets.EleStaves.Ice = {main="Laevateinn"}
    sets.EleStaves.Lightning = {main="Laevateinn"}
    sets.EleStaves.Light = {main="Iridal Staff"}
    sets.EleStaves.Dark = {main="Iridal Staff"}
	
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
		range={ name="Rune Bow" },
		ammo={ name="Rune Arrow" },
		head={ name="Silver Hairpin", augments={'"Fast Cast"+2',}}, 
		hands={ name="Garrison Gloves", augments={'"Fast Cast"+2',}},
		legs={ name="Garrison Hose", augments={'"Fast Cast"+2',}}, 
		neck={ name="Bloodbead Amulet", augments={'"Fast Cast"+2',}}, 
		waist={ name="Staff Belt", augments={'"Fast Cast"+2',}},
		left_ear={ name="Beetle Earring", augments={'"Fast Cast"+2',}}, 
		right_ear={ name="Beetle Earring", augments={'"Fast Cast"+2',}}, 
		left_ring={ name="Protean Ring", augments={'"Fast Cast"+2',}},
		right_ring={ name="Protean Ring", augments={'"Fast Cast"+2',}}, 
		back={ name="Mercen. Mantle", augments={'"Fast Cast"+2',}}
	}
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.Stoneskin = set_combine(sets.precast.FastCast['Enhancing Magic'],{ legs={"Haven Hose"}  })
    sets.precast.Manafont = {}
    sets.Impact = {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Reward = {ammo="Pet Food Zeta"}

	
    sets.midcast = {}	
	sets.midcast.EleMagic =     {
		sub="Amicus Grip",
		range={ name="Rune Bow" },
		ammo={ name="Rune Arrow" },
		head={ name="Sorcerer's Petasos +2", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},
		body={ name="Yhel Jacket", augments={'System: 1 ID: 131 Val: 1','INT+4','Occ. inc. resist. to stat. ailments +10',}},
		hands={ name="Goetia Gloves +1", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},
		legs={ name="Teal Slops", augments={'System: 1 ID: 131 Val: 1','INT+4','Occ. inc. resist. to stat. ailments +10',}},
		feet={ name="Wizard's Sabots", augments={'System: 1 ID: 131 Val: 1','INT+4',}},
		neck={ name="Feud Pendant", augments={'"Fast Cast"+2','System: 1 ID: 131 Val: 5','INT+6','Fire Affinity: Avatar perp. cost+3',}},
		waist={ name="Sanctuary Obi +1", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},		
		left_ear={ name="Hecate's Earring"},
		right_ear={ name="Moldavite Earring", augments={'System: 1 ID: 131 Val: 1','INT+4',}},
		left_ring={ name="Icesoul Ring", augments={'"Fast Cast"+2','System: 1 ID: 131 Val: 5','INT+6','Fire Affinity: Avatar perp. cost+3',}},
		right_ring={ name="Icesoul Ring", augments={'"Fast Cast"+2','System: 1 ID: 131 Val: 5','INT+6','Fire Affinity: Avatar perp. cost+3',}},
		back={ name="Eloquence Cape", augments={'INT+2','Enmity-2','System: 1 ID: 131 Val: 5','Fire Affinity: Avatar perp. cost+3',}},
	}
	
	sets.midcast.seventyFiveCap = set_combine(sets.midcast.EleMagic, {
	sub={name="Dark Grip"},
	head={ name="Wizard's Petasos" },
	neck={ name="Philomath Stole"},
	legs={ name="Druid's Slops" },
	waist={ name="Penitent's Rope" },
	left_ring={"Genius Ring"},
	right_ring={"Genius Ring"},
	})	
    sets.midcast.Stun = {    }
    
    sets.midcast['Elemental Magic'] = {
        [0] = {},
        [1] = {}
        }
		
		sets.midcast.SRing = {left_ring="Sorcerer's Ring"}
        
    sets.ElementalMagicMAB = {
            Earth={},
            Dark={}
        }
    
    -- MAcc level 0 (Macc and Enmity irrelevant)
    sets.midcast['Elemental Magic'][0][0] = set_combine(sets.midcast.EleMagic, {  })
        
    sets.midcast.MB=set_combine(sets.midcast.EleMagic,{ })
    
    --sets.midcast['Elemental Magic'][0][0] = set_combine(sets.midcast['Elemental Magic'][0][0],sets.midcast.MB)
    
    sets.midcast['Elemental Magic'][0][1] = set_combine(sets.midcast['Elemental Magic'][0][0],{       })
    
    -- MAcc level 1 (MAcc and Enmity relevant)
    sets.midcast['Elemental Magic'][1][0] = {    }
                
    sets.midcast['Elemental Magic'][1][1] = set_combine(sets.midcast['Elemental Magic'][1][0],{        })
    
    sets.midcast.Death = {    }
	sets.midcast['Dia II'] = sets.TH
    sets.midcast.Dia = sets.TH
    sets.midcast.Bio = sets.TH
    sets.midcast.Diaga = sets.TH
    sets.midcast.Burn = sets.TH
    sets.midcast.Sleepga = sets.TH
	sets.midcast.Drain = sets.DrainAspir
	sets.midcast.Aspir = sets.DrainAspir
	sets.midcast['Aspir II']= sets.DrainAspir
	
    
    sets.midcast['Dark Magic'] = {legs="Wizard's Tonban", neck="Dark Torque"}
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.EleMagic, {body="Wizard's coat", neck="Spider Torque", head="Igqira Tiara", right_ear="Enfeebling Earring"})
    sets.midcast.Vidohunir = {        }
    sets.midcast.Myrkr = {    }
    sets.midcast.Cure = {main="Iridal Staff", body="Wizard's Coat", hands="Wizard's Gloves", feet="Wizard's Sabots",
    neck="Promise Badge", waist="Penitent's Rope", left_ear="Valor Earring", right_ear="Valor Earring", left_ring="Solace Ring", right_ring="Solace Ring", back="Ixion Cape"}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
    sets.aftercast.Idle = {main="Earth Staff",
		head={ name="Sorcerer's Petasos +2", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},
		body={ name="Yhel Jacket", augments={'System: 1 ID: 131 Val: 1','INT+4','Occ. inc. resist. to stat. ailments +10',}},
		back="Cheviot Cape",
		legs={ name="Teal Slops", augments={'System: 1 ID: 131 Val: 1','INT+4','Occ. inc. resist. to stat. ailments +10',}},
		waist={ name="Sanctuary Obi +1", augments={'System: 1 ID: 131 Val: 5','Occ. inc. resist. to stat. ailments +10','INT+6','"Treasure Hunter"+1',}},		
		left_ring="Jelly Ring",
		feet="Herald's Gaiters"}
		
    sets.aftercast.Idle['Mana Wall'] = {        }
    
    sets.aftercast.Resting = { main="Iridal Staff", neck="Grandiose Chain", waist="Qiqirn Sash +1", body="Seer's Tunic" }
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
    send_command('input /macro book 2;wait .1;input /macro set 1')
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Idle')
	
	stone_spells = T{"Stone", "Stone II", "Stone III", "Stone IV", "Stone V"}
	water_spells = T{"Water", "Water II", "Water III", "Water IV", "Water V"}
	aero_spells = T{"Aero", "Aero II", "Aero III", "Aero IV", "Aero V"}
	fire_spells = T{"Fire", "Fire II", "Fire III", "Fire IV", "Fire V"}
	blizzard_spells = T{"Blizzard", "Blizzard II", "Blizzard III", "Blizzard IV", "Blizzard V"}
	thunder_spells = T{"Thunder", "Thunder II", "Thunder III", "Thunder IV", "Thunder V"}
	Tier1Spells = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
end


function precast(spell)
    --current_spells = T(windower.ffxi.get_spells()):filter(boolean._true):keyset()
	--if not(current_spells:contains(spell.english)) then
		
	--end
	
	add_to_chat(7, stone_spells[4])
	
	equip(sets.precast[spell_element])
	
	if showInfo == true then
			--spell info echo
		if spell.type:contains("Magic") then
			add_to_chat(7, '['..spell.english..']:- MP cost: '..spell.mp_cost..' - Target: ' ..spell.target.name.. ' - Element: ' ..spell.element.. ' - Cast Time: ' ..spell.cast_time.. ' - Recast Time: ' ..spell.recast.. ' - Range: ' ..spell.range.. ' - 	Classification: ' ..spell.type.. '/' ..spell.skill.. '')
		end
			--player info echo
			add_to_chat(7, '['..player.name..']:- MP: '..player.mp..' - HP: ' ..player.hp.. ' - TP:  ' ..player.tp..'')
	end

	
    if sets.precast[spell.english] then
        equip(sets.precast[spell.english][macc_level] or sets.precast[spell.english])
    elseif string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        equip(sets.precast.Cure)
    elseif spell.english == 'Impact' then
        equip(sets.precast.FastCast['Elemental Magic'],sets.Impact)
        if not buffactive['Elemental Seal'] then
            add_to_chat(8,'--------- Elemental Seal is down ---------')
        end
    elseif spell.action_type == 'Magic' then
        if spell.skill == 'Elemental Magic' then
            if not(Tier1Spells:contains(spell.english)) then
				equip(sets.precast.FastCast['Elemental Magic'])
			end
        elseif spell.skill == 'Enhancing Magic' then
            equip(sets.precast.FastCast['Enhancing Magic'])
        else
            equip(sets.precast.FastCast.Default)
        end
    end
	
--	if spell.action_type == "JobAbility" then
		if sets.precast.JobAbility[spell.english] then
			equip(sets.precast.JobAbility[spell.english])
		end
	
    if spell.english == 'Stun' and stuntarg ~= 'Shantotto' then
        send_command('@input /t '..stuntarg..' ---- Byrth Stunned!!! ---- ')
    end
    
	

	
end

function midcast(spell)  
	if spell.action_type == 'Magic' then
        equip(sets.midcast.EleMagic)
		--add_to_chat(7, '['..spell.english..']:- Element: ' ..spell.element.. ' - Day Element: ' ..world.day_element.. '')

    end
    
    if string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        weathercheck(spell.element,sets.midcast.Cure)
    elseif spell.english == 'Impact' then
        weathercheck(spell.element,set_combine(sets.midcast['Elemental Magic'][macc_level][mp_efficiency],sets.Impact))
    elseif spell.english == 'Death' then
        equip(sets.midcast.Death)
    elseif sets.midcast[spell.name] then
        weathercheck(spell.element,sets.midcast[spell.name])
    elseif spell.skill == 'Elemental Magic' then
        weathercheck(spell.element,sets.midcast.EleMagic)
		if player.hpp > 100 then
			equip(sets.midcast.SRing)
			send_command('@input /echo >> HP: ' ..player.hpp.. ' - Sorcerer Ring Active <<')		
		end
        if sets.ElementalMagicMAB[spell.element] then
            equip(sets.ElementalMagicMAB[spell.element])
        end
		if player.main_job_level == 75 then
			equip (sets.midcast.seventyFiveCap)
		end
	elseif spell.skill == 'Enfeebling Magic' then
        equip(sets.midcast['Enfeebling Magic'])
    elseif spell.skill == "Enhancing Magic" and not S{'Warp','Warp II','Retrace','Teleport-Holla','Teleport-Mea','Teleport-Dem','Teleport-Altep','Teleport-Vahzl','Teleport-Yhoat'}:contains(spell.english) then
        equip(sets.midcast.EnhancingDuration)
    elseif spell.skill then
        equip(sets.aftercast.Idle)
        weathercheck(spell.element,sets.midcast[spell.skill])
    end
    equip(sets.EleStaves[spell.element])
		
	--add_to_chat(8,skillup)
	if (skillup == '1') and (spell.english=="Barfire") then
		--cancel_spell()
		send_command('wait 3;input /ma "Barblizzard" <me>')		
	elseif skillup == '1' and spell.english=="Barblizzard" then
		--cancel_spell()
		send_command('wait 3;input /ma "Baraero" <me>')	
	elseif skillup == '1' and spell.english=="Baraero" then
		--cancel_spell()
		send_command('wait 3;input /ma "Barstone" <me>')
	elseif skillup == '1' and spell.english=="Barstone" then
		--cancel_spell()
		send_command('wait 3;input /ma "Barthunder" <me>')
	elseif skillup == '1' and spell.english=="Barthunder" then
		--cancel_spell()
		send_command('wait 3;input /ma "Barwater" <me>')	
	elseif skillup == '1' and spell.english=="Barwater" then
		--cancel_spell()
		send_command('wait 3;input /ma "Barfire" <me>')
	end
	
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end
    
		
	--if spell.english == "Blizzard III" then
--		send_command('wait '..t3delay..';input /ma "Aero III" <bt>')
--	elseif spell.english == "Aero III" then	
		--send_command('wait '..t3delay..';input /ma "Stone III" <bt>')
	--elseif spell.english == "Stone III" then
--		send_command('wait '..t3delay..';input /ma "Thunder III" <bt>')
--	end	
--	
--	if spell.english == "Blizzard II" then
		--send_command('wait '..t2delay..';input /ma "Aero II" <bt>')
	--elseif spell.english == "Aero II" then	
--		send_command('wait '..t2delay..';input /ma "Stone II" <bt>')
--	end
	
end

function aftercast(spell)
    if player.status == 'Idle' then
        equip_idle_set()
		--equip(sets.aftercast.Idle)
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
	if command:lower() == "t3nukes" then
		add_to_chat(8,"T3's - Got it!")
		send_command('input /ma "Blizzard III" <bt>')
	elseif command:lower() == "t2nukes" then
		add_to_chat(8,"T2's? Y'sure? Alrighty then!")
		send_command('input /ma "Blizzard II" <bt>')	
	elseif command:lower() == "restup" then
		add_to_chat(8,"Takin' a break!")
		send_command('input /p Having a rest!; input /heal; wait 60; input /heal; input /p Ready to go!')
	end
	
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