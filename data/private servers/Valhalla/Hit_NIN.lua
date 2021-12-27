include('organizer-lib')

showInfo = true
TPStyle = {"Default", "Attack", "Accuracy", "Turtle"}
TPStyleIndex = 1

function get_sets()

	
    sets.TH = {
		left_ear={ name="Phryg. Earring +1", augments={'"Treasure Hunter"+1',}},
		right_ear={ name="Phryg. Earring +1", augments={'"Treasure Hunter"+1',}},
		right_ring={ name="Heed Ring", augments={'"Treasure Hunter"+1',}},
	}
    
    sets.precast = {} 
    sets.precast.FastCast = {}
    sets.precast.FastCast.Default =    {
		ammo={ name="Kilo Fan", augments={'"Fast Cast"+2',}}, 
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
    sets.precast.FastCast['Ninjutsu'] = set_combine(sets.precast.FastCast.Default,{   })
	
	sets.Enmity= {}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Invincible = {}
	sets.precast.JobAbility.Sentinel = {}
	sets.precast.JobAbility['Shield Bash'] = {}
	sets.precast.JobAbility.Cover = {head="Gallant Coronet"}
	sets.precast.JobAbility.Provoke = set_combine(sets.Enmity,{})
	sets.precast.JobAbility.Rampart = {}
	sets.precast.JobAbility.Reward = {ammo="Pet Food Zeta"}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills['Blade: Jin'] = {body="Haubergeon +1"}
	sets.precast.WeaponSkills['Swift Blade'] = {}
	sets.precast.WeaponSkills['Sanguine Blade'] = {}
	sets.precast.WeaponSkills['Atonement'] = {}
	sets.precast.WeaponSkills['Knights of Round']	= {}
	

	
    sets.midcast = {}
    sets.midcast.magic_base = {	}
	
	sets.midcast['Healing Magic'] = { }
    
    
    sets.midcast.Cure = {	}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{ legs="Haven Hose" })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
        
    sets.aftercast.Resting = { neck="Grandiose Chain", waist="Qiqirn Sash +1" }
    sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Katana = {main="Sairen", sub="Hocho"}
	sets.aftercast.Engaged.Default = set_combine(sets.aftercast.Engaged.Katana, {
		ammo={ name="Happy Egg", augments={'DMG:+4','Haste+4','System: 1 ID: 132 Val: 3','"Store TP"+4 "Subtle Blow"+4',}},
		head={ name="Walkure Mask" },
		body="Ninja Chainmail",
		hands="Horomusha Kote",
		legs="Garrison hose",
		feet="Gothic Sabatons",
		neck="Peacock Amulet",
		waist="Velocious Belt",
		left_ear="Coral Earring",
		right_ear="Giant's Earring",
		left_ring="Toreador's Ring",
		right_ring="Toreador's Ring",
		back={ name="Variable Mantle"}
	})
	sets.aftercast.Engaged.Attack = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})
    
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Default, {	left_ring="Jelly Ring"})

    
    send_command('input /macro book 7;wait .1;input /macro set 1')
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Engaged.Default')
	send_command('gs equip sets.aftercast.Engaged.Katana')
	send_command('input /echo [F9] Bound to Default TP Gear;bind F9 gs c default')
	send_command('input /echo [F10] Bound to Set Attack heavy TP Gear;bind F10 gs c attack')
	send_command('input /echo [F11] Bound to Set Accuracy heavy TP Gear;bind F11 gs c accuracy')
	send_command('input /echo [F12] Bound to Set Defense heavy TP Gear;bind F12 gs c evasion')
	send_command('input /echo [Alt-D] Bound to Yonin;bind !d /ja "Yonin" <me>')
	send_command('input /echo [Ctrl-D] Bound to Innin;bind ^d /ja "Innin" <me>')
	
	disable('main','sub')
	
	Tier1Spells = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
end


function precast(spell)
	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	end

	if sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	else
		equip(sets.precast.WeaponSkills['Savage Blade'])
	end


	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
end
function midcast(spell)
	
	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        equip(sets.precast.Cure)
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
