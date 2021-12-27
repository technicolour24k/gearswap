include('organizer-lib')

function get_sets()
    mp_efficiency = 0
    macc_level = 0
    
	sets.EleStaves = {}
    sets.EleStaves.Fire = {main="Fire Staff",}
    sets.EleStaves.Earth = {main="Earth Staff",}
    sets.EleStaves.Water = {main="Water Staff",}
    sets.EleStaves.Wind = {main="Wind Staff",}
    sets.EleStaves.Ice = {main="Aquilo's Staff",}
    sets.EleStaves.Lightning = {main="Thunder Staff",}
    sets.EleStaves.Light = {main="Light Staff",}
    sets.EleStaves.Dark = {main="Dark Staff",}
	
    sets.TH = {    }
    
    sets.precast = {}
    
    
    sets.precast.FastCast = {}
    
    sets.precast.FastCast.Default = {    }
    
    sets.precast.FastCast.Fire = set_combine(sets.precast.FastCast.Default,{main="Fire Staff"})
    
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.Stoneskin = set_combine(sets.precast.FastCast['Enhancing Magic'],{     })
    
    sets.precast.Manafont = {}
    
    sets.Impact = {}
    
    sets.midcast = {}
    
    sets.midcast.magic_base ={head="Sage's Circlet", body="Wizard's Coat", hands="Wizard's Gloves", legs="Wizard's Tonban", feet="Wizard's Sabots", neck="Black Neckerchief", waist="Shaman's Belt",
		left_ear="Valor Earring", right_ear="Moldavite Earring", left_ring="Zircon Ring", right_ring="Zircon Ring", back="Black Cape +1", feet="Wizard's Sabots"}
		
	   
    sets.midcast.Stun = {    }
    
    sets.midcast['Elemental Magic'] = {
        [0] = {},
        [1] = {}
        }
		
		sets.midcast['Elemental Magic']['Fire'] = set_combine(sets.midcast.magic_base, {main="Fire Staff"})
		sets.midcast['Elemental Magic']['Wind'] = set_combine(sets.midcast.magic_base, {main="Wind Staff"})
		sets.midcast['Elemental Magic']['Ice'] = set_combine(sets.midcast.magic_base, {main="Aquilo's Staff"})
		sets.midcast['Elemental Magic']['Lightning'] = set_combine(sets.midcast.magic_base, {main="Thunder Staff"})
		sets.midcast['Elemental Magic']['Dark'] = set_combine(sets.midcast.magic_base, {main="Dark Staff"})
		sets.midcast['Elemental Magic']['Water'] = set_combine(sets.midcast.magic_base, {main="Water Staff"})
		sets.midcast['Elemental Magic']['Light'] = set_combine(sets.midcast.magic_base, {main="Light Staff"})
		sets.midcast['Elemental Magic']['Earth'] = set_combine(sets.midcast.magic_base, {main="Earth Staff"})
        
    sets.ElementalMagicMAB = {
            Earth={},
            Dark={}
        }
    
    -- MAcc level 0 (Macc and Enmity irrelevant)
    sets.midcast['Elemental Magic'][0][0] = set_combine(sets.midcast.magic_base, { })
        
    sets.midcast.MB=set_combine(sets.midcast.magic_base,{ })
    
    --sets.midcast['Elemental Magic'][0][0] = set_combine(sets.midcast['Elemental Magic'][0][0],sets.midcast.MB)
    
    sets.midcast['Elemental Magic'][0][1] = set_combine(sets.midcast['Elemental Magic'][0][0],{       })
    
    -- MAcc level 1 (MAcc and Enmity relevant)
    sets.midcast['Elemental Magic'][1][0] = {    }
                
    sets.midcast['Elemental Magic'][1][1] = set_combine(sets.midcast['Elemental Magic'][1][0],{        })
    
    sets.midcast.Death = {    }
    sets.midcast['Dia II'] = sets.TH
    sets.midcast.Dia = sets.TH
    sets.midcast.Diaga = sets.TH
    sets.midcast.Burn = sets.TH
                
    
    sets.midcast['Dark Magic'] = {
		legs="Wizard's Tonban"
    }
    
    sets.midcast['Enfeebling Magic'] = {
		body="Wizard's Coat", neck="Spider Torque"
	}
        
    sets.midcast.Vidohunir = {        }
    
    sets.midcast.Myrkr = {    }
    
    sets.midcast.Cure = {main="Melampus Staff", body="Seer's Tunic", hands="Zealot's Mitts", feet="Seer's Pumps +1",
    neck="Justice Badge", waist="Friar's Rope", left_ear="Valor Earring", right_ear="Valor Earring", left_ring="Solace Ring", right_ring="Solace Ring", back="White Cape +1"}
        
    
    sets.midcast.EnhancingDuration = {    }
    
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{        })
    
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
    sets.aftercast.Idle = {}
    sets.aftercast.Idle.keys = {[0]="Refresh",[1]="PDT"}
    sets.aftercast.Idle.ind = 0
--[[    sets.aftercast.Idle[0] = {
        main="Laevateinn",
        sub={name="Niobid Strap",mp=20},
        ammo={name="Ghastly Tathlum +1",mp=35},
        head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+28','"Fast Cast"+3','"Refresh"+1','Mag. Acc.+6 "Mag.Atk.Bns."+6',},hp=22,mp=56},
        body={ name="Witching Robe", augments={'MP+50','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',},hp=50,mp=117},
        hands={name="Amalric Gages +1",hp=13,mp=106},
        legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',},hp=43,mp=29},
        feet={ name="Amalric Nails +1", hp=4,mp=106},
        neck="Loricate Torque +1",
        waist={name="Mujin Obi",mp=60},
        ear1={name="Etiolation Earring",hp=50,mp=50},
        right_ear={name="Gifted Earring",mp=45},
        left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%','Magic dmg. taken -5%',},hp=-20,mp=20},
        right_ring="Defending Ring",
        back={ name="Bane Cape", augments={'Elem. magic skill +3','Dark magic skill +7','"Mag.Atk.Bns."+1','"Fast Cast"+5',}},
    }]]
    sets.aftercast.Idle[0] = {        }
        
    sets.aftercast.Idle[1] = {        }
        
    sets.aftercast.Idle['Mana Wall'] = {        }
                
    sets.aftercast.Resting = { main="Spiro Staff", waist="Qiqirn Sash +1", body="Seer's Tunic" }
                
    sets.aftercast.Engaged = {        }
    
    sets.Obis = {}
    sets.Obis.Fire = {}
    sets.Obis.Earth = {}
    sets.Obis.Water = {}
    sets.Obis.Wind = {}
    sets.Obis.Ice = {}
    sets.Obis.Lightning = {}
    sets.Obis.Light = {}
    sets.Obis.Dark = {}
    
    
    --sets.aftercast.empty = {neck="Loricate Torque +1"}
    --sets.aftercast.Chry = {neck={name="Chrysopoeia Torque",mp=30}}
    tp_level = 'empty'
    
    stuntarg = 'Shantotto'
    send_command('input /macro book 1;wait .1;input /macro set 1')
end


function precast(spell)
        equip(sets.precast[spell_element])

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
            equip(sets.precast.FastCast['Elemental Magic'])
        elseif spell.skill == 'Enhancing Magic' then
            equip(sets.precast.FastCast['Enhancing Magic'])
        else
            equip(sets.precast.FastCast.Default)
        end
    end
    
    if spell.english == 'Stun' and stuntarg ~= 'Shantotto' then
        send_command('@input /t '..stuntarg..' ---- Byrth Stunned!!! ---- ')
    end
    
end

function midcast(spell)
	    
            send_command('@input /echo ------- '..spell.english..' element is '..spell.element..'-------')
        
    if spell.action_type == 'Magic' then
        equip(sets.midcast.magic_base)
	    equip(sets.midcast[spell.skill][spell.element])

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
        weathercheck(spell.element,sets.midcast['Elemental Magic'][macc_level][mp_efficiency])
        if sets.ElementalMagicMAB[spell.element] then
            equip(sets.ElementalMagicMAB[spell.element])
        end
    elseif spell.skill == "Enhancing Magic" and not S{'Warp','Warp II','Retrace','Teleport-Holla','Teleport-Mea','Teleport-Dem','Teleport-Altep','Teleport-Vahzl','Teleport-Yhoat'}:contains(spell.english) then
        equip(sets.midcast.EnhancingDuration)
    elseif spell.skill then
        equip(sets.aftercast.Idle,sets.aftercast[tp_level])
        weathercheck(spell.element,sets.midcast[spell.skill])
    end
    equip(sets.midcast['Elemental Magic'][spell.element])
	
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end
    
end

function aftercast(spell)
    if player.status == 'Idle' then
        equip_idle_set()
    elseif sets.aftercast[player.status] then
        equip(sets.aftercast[player.status],sets.aftercast[tp_level])
    else
        equip(sets.aftercast.Idle,sets.aftercast[tp_level])
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
            equip(sets.aftercast.Engaged,sets.aftercast[tp_level])
        end
        disable('main','sub')
    else
        equip_idle_set()
        equip(sets.aftercast[tp_level])
    end
    
end

function buff_change(name,gol,tab)

end

function self_command(command)

end

-- This function is user defined, but never called by GearSwap itself. It's just a user function that's only called from user functions. I wanted to check the weather and equip a weather-based set for some spells, so it made sense to make a function for it instead of replicating the conditional in multiple places.

function weathercheck(spell_element,set)
    if not set then return end
    if spell_element == world.weather_element or spell_element == world.day_element then
        equip(set,sets.Obis[spell_element])
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
end


function equip_idle_set()
    if buffactive['Mana Wall'] then
        equip(sets.aftercast.Idle[sets.aftercast.Idle.ind],sets.aftercast.Idle['Mana Wall'])
    else
        equip(sets.aftercast.Idle[sets.aftercast.Idle.ind])
    end
    if player.tp == 3000 then equip(sets.aftercast.Chry) end
    
end
