include('organizer-lib')

skillup = 0
showInfo = true
target = 0

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

		}
    
    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    {
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
	
    
    sets.midcast['Dark Magic'] = {legs="Wizard's Tonban", neck="Dark Torque", head="Khthonios Helm"}
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.EleMagic, {body="Wizard's coat", neck="Spider Torque", head="Igqira Tiara", right_ear="Enfeebling Earring", hands="Teal Cuffs +1"})
    sets.midcast.Vidohunir = {        }
    sets.midcast.Myrkr = {    }
    sets.midcast.Cure = {main="Iridal Staff"}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
    sets.aftercast.Idle = {main="Earth Staff"}
		
    sets.aftercast.Idle['Mana Wall'] = {        }
    
    sets.aftercast.Resting = { main="Iridal Staff", neck="Grandiose Chain", waist="Qiqirn Sash +1", body="Seer's Tunic", legs="Oracle's Braconi" }
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
	send_command('input /echo [Alt+1] Bound to follow on Zoku;bind !1 send Zoku /follow Kin')
	send_command('input /echo [Alt+2] Bound to follow on Hit;bind !2 send Hit /follow Kin')
	send_command('input /echo [Alt+F12] Bound to Skillup toggle;bind !F12 gs c skillup')
	
	Tier1Spells = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
end


function precast(spell)
    equip(sets.precast[spell_element])
	if showInfo == true then
			--spell info echo
		if spell.type:contains("Magic") then
			add_to_chat(7, '['..spell.english..']:- MP cost: '..spell.mp_cost..' - Target: ' ..spell.target.name.. ' - Element: ' ..spell.element.. ' - Cast Time: ' ..spell.cast_time.. ' - Recast Time: ' ..spell.recast.. ' - Range: ' ..spell.range.. ' - 	Classification: ' ..spell.type.. '/' ..spell.skill.. '')
			--add_to_chat(7, '['..player.target.id..']:- ')
		end
			--player info echo
			add_to_chat(7, '['..player.name..']:- MP: '..player.mp..' - HP: ' ..player.hp.. ' - TP:  ' ..player.tp..'')
	end

	
	if (player.target.type == "MONSTER") then
		setTargetID(spell.target.id)
		--send_command('send Zoku /assist Kin')
		--send_command('send Zoku /a')
		--send_command('send Hit /assist Kin')
		--send_command('send Hit /a ' ..target)
		--send_command('send Lohkie /assist Kin')
		--send_command('send Lohkie /a ' ..target)
		
		if spell.english == "Stone" then
			send_command('send Zoku /ma "Stone III" '..target)
			send_command('send Hit /ma "Stone III" ' ..target)
			send_command('send Lohkie /ma "Stone III" ' ..target)
		elseif spell.english == "Water" then
			send_command('send Zoku /ma "Water III" '..target)
			send_command('send Hit /ma "Water III" ' ..target)
			send_command('send Lohkie /ma "Water III" ' ..target)
		elseif spell.english == "Aero" then
			send_command('send Zoku /ma "Aero III" '..target)
			send_command('send Hit /ma "Aero III" ' ..target)
			send_command('send Lohkie /ma "Aero III" ' ..target)
		elseif spell.english == "Fire" then
			send_command('send Zoku /ma "Fire III" '..target)
			send_command('send Hit /ma "Fire III" ' ..target)
			send_command('send Lohkie /ma "Fire III" ' ..target)
		elseif spell.english == "Blizzard" then
			send_command('send Zoku /ma "Blizzard III" '..target)
			send_command('send Hit /ma "Blizzard III" ' ..target)
			send_command('send Lohkie /ma "Blizzard III" ' ..target)
		elseif spell.english == "Thunder" then
			send_command('send Zoku /ma "Thunder III" '..target)
			send_command('send Hit /ma "Thunder III" ' ..target)
			send_command('send Lohkie /ma "Thunder III" ' ..target)
		end
	end
    
end

function midcast(spell)  
   
    if string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        weathercheck(spell.element,sets.midcast.Cure)
	end
	
    if spell.english == 'Sneak' and spell.target.name == player.name then
        send_command('cancel 71;')
    end
    
	
	if skillup == 1 then
		if spell.english == "Mage's Ballad III" then
			send_command('wait 13;input /ma "Sage Etude" <me>')
		elseif spell.english == "Sage Etude" then
			send_command('wait 13;input /ma "Learned Etude" <me>')
		elseif spell.english == "Learned Etude" then
			send_command('wait 13;input /ma "Mage\'s Ballad II" <me>')
		elseif spell.english == "Mage's Ballad II" then
			send_command('wait 13;input /ma "Mage\'s Ballad III" <me>')
		end	
		
		if spell.english == "Blizzard II" then
			send_command('wait '..t2delay..';input /ma "Aero II" <bt>')
		elseif spell.english == "Aero II" then	
			send_command('wait '..t2delay..';input /ma "Stone II" <bt>')
		end
	end
	
	
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
	if command:lower() == "skillup" then
		if skillup == 0 then
			skillup = 1
		elseif skillup==1 then
			skillup = 0
		end
	add_to_chat(8, 'Skillup: ' ..skillup)
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

function setTargetID(targetID)
	target = targetID
end