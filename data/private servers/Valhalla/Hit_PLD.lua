include('organizer-lib')

showInfo = true
TPStyle = {"Default", "Attack", "Accuracy", "Turtle"}
TPStyleIndex = 1

function get_sets()

	state = {}
	state.Buff={}
    state.Buff.Doom = buffactive['doom'] or false


	
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
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{ left_ear="Oneiros Earring" }  )
    sets.precast.Stoneskin = set_combine(sets.precast.FastCast['Enhancing Magic'],{ legs={"Haven Hose"}  })
    sets.Impact = {body="Twilight Cloak"}
	
	sets.Enmity= {head="Aegishjalmr"}
	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility.Invincible = {}
	sets.precast.JobAbility.Sentinel = { feet="Valor Leggings" }
	sets.precast.JobAbility['Shield Bash'] = { hands = {name="Valor Gauntlets +1" } }
	sets.precast.JobAbility.Cover = {head="Gallant Coronet"}
	sets.precast.JobAbility.Provoke = set_combine(sets.Enmity,{})
	sets.precast.JobAbility.Rampart = { head="Valor Coronet"}
	sets.precast.JobAbility.Reward = {ammo="Pet Food Zeta"}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills['Requiescat'] = {}
	sets.precast.WeaponSkills['Chant du Cygne'] = {}
	sets.precast.WeaponSkills['Sanguine Blade'] = {}
	sets.precast.WeaponSkills['Atonement'] = {}
	sets.precast.WeaponSkills['Knights of Round']	= {}
	

	
    sets.midcast = {}
    sets.midcast.magic_base = {	}
	
	sets.midcast['Healing Magic'] = { }
    
    
    sets.midcast.Cure = {	
		ammo={ name="Kabura Arrow", augments={'HP+10','MND+4','"Cure" potency +2%','Healing magic skill +3',}},
		head="Valor Coronet", 
		left_ear="Oneiros Earring",
		right_ear="Neptune's Pearl"
	}
    sets.midcast.EnhancingDuration = {    }
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{ legs="Haven Hose" })
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{        })
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{ })
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
    
    sets.aftercast = {}
        
    sets.aftercast.Resting = { neck="Grandiose Chain", waist="Qiqirn Sash +1" }
    sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.SwordShield = {main="Burtgang", sub="Aegis"}
	sets.aftercast.Engaged.Default = set_combine(sets.aftercast.Engaged.SwordShield, {
		ranged={ name="Killer Shortbow" },
		ammo={ name="Kabura Arrow", augments={'Haste+2','HP+10','Occ. inc. resist. to stat. ailments +10','Attack+15',}},
		head={ name="Creed Armet +1" },
		body="Creed Cuirass +2",
		hands="Perle Moufles +1",
		legs="Creed Cuisses +2",
		feet="Ruffian Leggings",
		neck="Ziel Charm",
		waist="Nierenschutz",
		left_ear="Creed Earring",
		right_ear="Brutal Earring",
		right_ring="Succor Ring",
		left_ring="Toreador's Ring",
		back={ name="Metallon Mantle"}
	})
	sets.aftercast.Engaged.Attack = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Turtle = set_combine(sets.aftercast.Engaged.Default, {head="Aegishjalmr", right_ear="Buckler Earring",})
    
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Default, {left_ring="Jelly Ring", 	right_ring="Succor Ring", legs="Crimson Cuisses"})
	
    sets.Obis = {}
    sets.Obis.Fire = {legs="Sorcerer's Tonban"}
    sets.Obis.Earth = {legs="Sorcerer's Tonban"}
    sets.Obis.Water = {legs="Sorcerer's Tonban"}
    sets.Obis.Wind = {legs="Sorcerer's Tonban"}
    sets.Obis.Ice = {legs="Sorcerer's Tonban"}
    sets.Obis.Lightning = {legs="Sorcerer's Tonban"}
    sets.Obis.Light = {legs="Sorcerer's Tonban"}
    sets.Obis.Dark = {legs="Sorcerer's Tonban"}
    
    send_command('input /macro book 1;wait .1;input /macro set 1')
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Engaged.Default')
	send_command('gs equip sets.aftercast.Engaged.SwordShield')
	send_command('input /echo [F9] Bound to Default TP Gear;bind F9 gs c default')
	send_command('input /echo [F10] Bound to Set Attack heavy TP Gear;bind F10 gs c attack')
	send_command('input /echo [F11] Bound to Set Accuracy heavy TP Gear;bind F11 gs c accuracy')
	send_command('input /echo [F12] Bound to Set Defense heavy TP Gear;bind F12 gs c turtle')
	send_command('input /echo [Ctrl+F1] Bound to T3 Nukes on mules;bind ^F1 gs c mulet3nukes')
	send_command('input /echo [Ctrl+F2] Bound to T2 Nukes on mules;bind ^F2 gs c mulet2nukes')
	send_command('input /echo [Ctrl+T] Bound to rest on mules;bind !a gs c mymulerest')
	
	disable('main','sub')
	
	stoneSpells = T{"Stone", "Stone II", "Stone III", "Stone IV", "Stone V"}
	waterSpells = T{"Water", "Water II", "Water III", "Water IV", "Water V"}
	windSpells = T{"Aero", "Aero II", "Aero III", "Aero IV", "Aero V"}
	fireSpells = T{"Fire", "Fire II", "Fire III", "Fire IV", "Fire V"}
	blizzardSpells = T{"Blizzard", "Blizzard II", "Blizzard III", "Blizzard IV", "Blizzard V"}
	thunderSpells = T{"Thunder", "Thunder II", "Thunder III", "Thunder IV", "Thunder V"}
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
		
	checkForMules()
	
	if spell.english:contains("Cure") then
		if zoku_in_party == "yes" then
			send_command('send Zoku /ma '..spell.english.. ' ' ..spell.target.name..'')
		end
	end
	
end
function midcast(spell)
	
	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        equip(sets.midcast.Cure)
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
	if name=="Doom" then
		--send_command('gs c doomspam')
		while (buffactive['Doom']) do
			send_command('gs c holyWaterSpam')
		end
	end
end

function self_command(command)

	if command:lower() == "mulet3nukes" then
		checkForMules()
		add_to_chat(9, ">> T3 Nukes")
		if zoku_in_party == "yes" then
			send_command('send Zoku /ma "Blizzard III" '..player.target.id)
		end
		if bringer_in_party == "yes" then
			send_command('send Bringer gs c t3nukes')
		end
		if lohkie_in_party == "yes" then
			send_command('send Lohkie /ma "Blizzard III" '..player.target.id)
		end
		if bringer_in_party=="no" and zoku_in_party=="no" and lohkie_in_party=="no" then
			add_to_chat(8, "No mule found.")
		end
	elseif command:lower() == "mulet2nukes" then
	checkForMules()
	add_to_chat(9, ">> T2 Nukes")
		if zoku_in_party == "yes" then
			send_command('send Zoku gs c t2nukes')
		end
		if bringer_in_party == "yes" then
			send_command('send Bringer gs c t2nukes')
		end
		if lohkie_in_party == "yes" then
			send_command('send Lohkie gs c t2nukes')
		end
		if bringer_in_party=="no" and zoku_in_party=="no" and lohkie_in_party=="no" then
			add_to_chat(8, "No mule found.")
		end
	elseif command:lower() == "mymulerest" then
	checkForMules()
		if zoku_in_party == "yes" then
			send_command('send Zoku gs c restup')
			add_to_chat(8, "Resting Zoku!")
		end
		if bringer_in_party == "yes" then
			send_command('send Zoku gs c restup')
		end
		if lohkie_in_party == "yes" then
			send_command('send Lohkie gs c restup')
		end
		if bringer_in_party=="no" and zoku_in_party=="no" and lohkie_in_party=="no" then
			add_to_chat(8, "No mule found.")
		end
	end
	

	if command:lower() == "default" then
		TPStyleIndex = 1
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "attack" then
		TPStyleIndex = 2		
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "accuracy" then
		TPStyleIndex = 3
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "turtle" then
		TPStyleIndex = 4
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	end
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]])
	else
		equip(sets.aftercast[player.status],sets.aftercast)
	end
	
	if command == 'holyWaterSpam' then
        send_command('input /item "Holy Water" <me>') --Start using a holy water
        --The times below may need tweaking. seriosuly, what the *** do i know, im not a *** horologist.
                --The wait timer before equipping holy water+ gear may not be necessary. I forget how long it takes to use a holy water. Tweak this ***as you see fit. 
        send_command('@wait 1; gs c doomCheck') -- waits 1.0 second until after you've used the item and then calls CHECK_DOOM
    elseif command == 'doomCheck' then
        if state.Buff.Doom then   --If your *** is still doomed (THANKS HOLY WATER, YOU HAD 1 *** JOB)
			send_command('input /item "Holy Water" <me>') --Start using a holy water
		end
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

function checkForMules()
	
	
	i = 1
	ptc = party.count
	zoku_in_party = "no"
	bringer_in_party = "no"
	lohkie_in_party = "no"
	
	while i < ptc+1 do
		if party[i].mob.name == "Zoku" then
			zoku_in_party = "yes"
		elseif party[i].mob.name == "Bringer" then
			bringer_in_party = "yes"
		elseif party[i].mob.name == "Lohkie" then
			lohkie_in_party = "yes"
		end
		i = i+1
	end
end