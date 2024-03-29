function get_sets()
    include("organizer-lib")
    TPStyle="default"
    weaponMode="h2h"    
    enspell_list = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Enlight","Endark"} --Store enspells for easily cancelling
    --Generic sets setup
	sets={}
    sets.precast = {}
	sets.midcast = {}
    sets.aftercast = {}
    sets.JobAbility = {}
    sets.WeaponSkills = {}
    sets.TH = {}
    sets.MAB = {}
    sets.staff = {
        main={ name="Exalted Staff", augments={'DMG:+8','DMG:+8','DMG:+8','DMG:+8',}},
        sub={ name="Dark Grip", augments={'DMG:+8','DMG:+8','DMG:+8','DMG:+8',}},    
    }
    sets.h2h ={
        main={ name="Em. Baghnakhs", augments={'DMG:+8','DMG:+8','DMG:+8','DMG:+8',}},
    }
    sets.slashing={
        main={ name="Vampiric Claws", augments={'DMG:+8','DMG:+8','DMG:+8','DMG:+8',}},
    }
    sets.piercing={
        main={ name="Birdbanes", augments={'DMG:+8','DMG:+8','DMG:+8','DMG:+8',}},
    }
    sets.precast.FastCast = {
        head={ name="Cache-nez", augments={'"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5',}},
        neck={ name="Silver Name Tag", augments={'"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5',}},
        left_ring={ name="Hermit's Ring", augments={'"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5',}},
        right_ring={ name="Hermit's Ring", augments={'"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5','"Fast Cast"+5',}},    
    }
	sets.precast.FastCast['Divine Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Summoning Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Ninjutsu'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Singing'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['String'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Wind'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Blue Magic'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Geomancy'] = set_combine(sets.precast.FastCast,{})
    sets.precast.FastCast['Handbell'] = set_combine(sets.precast.FastCast,{})
    sets.midcast['Divine Magic'] = {}
	sets.midcast['Healing Magic'] = {}
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast['Enfeebling Magic'] = {}
	sets.midcast['Elemental Magic'] = set_combine(sets.MAB,{})
	sets.midcast['Dark Magic'] = {}
	sets.midcast['Summoning Magic'] = {}
	sets.midcast['Ninjutsu'] = {}
	sets.midcast['Singing'] = {}
	sets.midcast['String'] = {}
	sets.midcast['Wind'] = {}
	sets.midcast['Blue Magic'] = {}
	sets.midcast['Geomancy'] = {}
	sets.midcast['Handbell'] = {}  
	
	sets.JobAbility["Hundred Fists"] = {}
	sets.JobAbility["Boost"] = {}
	sets.JobAbility["Focus"] = {}
    sets.JobAbility["Dodge"] = {}
	sets.JobAbility['Counterstance'] = {}
	sets.JobAbility['Chakra'] = {}
	sets.JobAbility['Jump'] = {}
	sets.JobAbility["Chi Blast"] = {}
	sets.JobAbility['Formless Strikes'] = {}
	sets.JobAbility['Perfect Counter'] = {}
	sets.JobAbility['Impetus'] = {}
    sets.JobAbility['Inner Strength'] = {}

    sets.WeaponSkills = {}
    --Fotia set
    sets.WeaponSkills['Fotia'] = {
		neck = "Fotia Gorget",
		waist = "Fotia Belt"
	}
    --Common WS gear - apply to all WS.
	sets.WeaponSkills["Common"] = set_combine(sets.WeaponSkills['Fotia'],{}) --Always equip Fotia gear, then overwrite it
	sets.WeaponSkills["Shijin Spiral"] = set_combine(sets.WeaponSkills['Common'],{}) --Always equip common gear, then overwrite it
	sets.WeaponSkills["Victory Smite"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Tornado Kick"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Ascetic\'s Fury"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Final Heaven"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Asuran Fists"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Spinning Attack"] = set_combine(sets.WeaponSkills['Common'],{})
    --Need another WS? Add it here with the same setup as above :D

	sets.midcast.Cure = {}

	sets.aftercast.Resting = {}
    
    --Recommend Damage Taken gear for Engaged default
	sets.aftercast.Engaged = {}
    sets.aftercast.Engaged.default={
        ammo={ name="Thew Bomblet", augments={'DMG:+8','DMG:+8','DMG:+8','DMG:+8',}},
        
        -- head={ name="Anchorite's Crown +1" },
        -- body={ name="Anchorite's Cyclas +1"},
        -- hands={ name="Anchorite's Gloves +1"},
        -- legs={ name="Anchorite's Hose +1"},
        -- feet={ name="Anchorite's Gaiters +1"},
        -- head={ name="Tantra Crown +2", augments={'"Store TP"+5','STR+7','"Dbl.Atk."+3','Attack+10',}},
        head = "Qaaxo Mask", -- Dropped from Laevvid
        body={ name="Tantra Cyclas +2", augments={'Evasion+12','STR+7','Attack+10','DEX+6',}},
        hands={ name="Tantra Gloves +2", augments={'"Store TP"+5','DEX+8','"Regen"+6','Mag. Evasion+6',}},
        legs={ name="Tantra Hose +2", augments={'DEF+10','STR+7','MND+7','"Mag.Def.Bns."+10',}},
        feet={ name="Tantra Gaiters +2", augments={'"Store TP"+5','"Counter"+5','Accuracy+10 Attack+10','STR+6',}},

        neck={ name="Temple Torque", augments={'DMG:+5','STR+6','"Martial Arts"+5','DEX+6',}},
        waist={ name="Crudelis Belt", augments={'"Mag.Def.Bns."+8','"Mag.Def.Bns."+8','"Mag.Def.Bns."+8','"Mag.Def.Bns."+8',}},
        left_ear={ name="Insomnia Earring", augments={'"Mag.Def.Bns."+10','"Counter"+5','"Subtle Blow"+5','Mag. Evasion+10',}},
        right_ear={ name="Moonshade Earring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
        left_ring={ name="Epona's Ring", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
        right_ring={ name="Rajas Ring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
        back={ name="Forager's Mantle", augments={'"Mag.Def.Bns."+8','"Mag.Def.Bns."+8','"Mag.Def.Bns."+8','"Mag.Def.Bns."+8',}},
    }
	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.default, {})
	
    --Regen, move speed, damage taken, etc
    sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {})

    sets.Obis = {}
	sets.Obis.AIO = {waist = "Hachirin-no-Obi"}
    sets.Obis.Fire = set_combine(sets.Obis.AIO, {waist="Karin Obi"})
    sets.Obis.Earth = set_combine(sets.Obis.AIO, {waist = "Dorin Obi"})
    sets.Obis.Water = set_combine(sets.Obis.AIO, {waist="Suirin Obi"})
    sets.Obis.Wind = set_combine(sets.Obis.AIO, {waist="Furin Obi"})
    sets.Obis.Ice = set_combine(sets.Obis.AIO, {waist="Hyorin Obi"})
    sets.Obis.Lightning = set_combine(sets.Obis.AIO, {waist="Rairin Obi"})
    sets.Obis.Light = set_combine(sets.Obis.AIO, {waist="Korin Obi"})
    sets.Obis.Dark = set_combine(sets.Obis.AIO, {waist="Anrin Obi"})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
    send_command("input /echo [F9] Toggle engaged gear; bind F9 gs c gear-swap")
    send_command("input /echo [F10] Toggle Weapon; bind F10 gs c weapon-swap")
end

function pretarget (spell)
    --Casting heals or buffs on a mob? Let's not do that - keep it for yourself!
    if (((spell.skill == "Healing Magic") or (spell.skill == "Enhancing Magic")) and (spell.target.type == "MONSTER")) then
		change_target("<me>")
		add_to_chat(11, spell.skill.." against a "..spell.target.type.."! Changing targets to self")
	end
end

function precast(spell)
    --Casting a spell? Let's speed that bad boy up: FAST CAST!
    if ((sets.precast.FastCast) and (spell.action_type=="Magic")) then
        equip(sets.precast.FastCast)
    end

    --Using a JA? If we've got a set for it, let's equip it.
    if sets.JobAbility[spell] then
		equip(sets.JobAbility[spell])
	end

    --Using a WS? If we've got a set for it, let's toss it on.
	if sets.WeaponSkills[spell] then
		equip(sets.WeaponSkills[spell])
	end

    --Got a specific precast set for a skill? Let's don that bad boy.
	if sets.precast[spell.skill] then
		equip(sets.precast[spell.skill])
	end

    --Got a specific precast set for a spell? Let's don that bad boy.
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
end

function midcast(spell)
    --Got a specific midcast set for a skill? Let's don that bad boy.
    if (sets.midcast[spell.skill]) then
        equip(sets.midcast[spell.skill])
    end
    --Got a specific precast set for a spell? Let's don that bad boy.
    if (sets.midcast[spell.english]) then
        equip(sets.midcast[spell.english])
    end

    --Casting a spicy little Cure, Cura, or Curaga? Let's make you a Doctor.
    if string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.midcast.Cure)
	end

    --Using an enspell? Pop on some exciting gear for that!
	if (enspell_list:contains(spell.english)) then
		equip(sets.midcast.Enspell)
	end

    --Final thing: Check weather for free damages!
	weathercheck(spell.element)
end

function aftercast(spell)
    if (player.status=="Engaged") then --If you're engaged
        equip(sets.aftercast[player.status][TPStyle]) --Then equip your current TP Style choice (default, TH, etc)
    else
        equip(sets.aftercast[player.status]) --If you're not engaged, then resort to your current status: Idle, Resting, etc
    end
    equip(sets[weaponMode])
end

function status_change(new, old)
    if (player.status=="Engaged") then --If you're engaged
        equip(sets.aftercast[player.status][TPStyle]) --Then equip your current TP Style choice (default, TH, etc)
    else
        equip(sets.aftercast[player.status]) --If you're not engaged, then resort to your current status: Idle, Resting, etc
    end
    equip(sets[weaponMode])
end

function buff_change(name, gain)

end

function self_command(command)
    if (command:lower() == "gear-swap") then --Trigger with "gs c gear-swap" in-game
        if (TPStyle == "default") then --If we're using our standard gear, then switch to TH
			TPStyle = "TH"
		elseif (TPStyle == "TH") then --If we're using TH gear, then swap to Accuracy
			TPStyle="Accuracy"
        else --If it's not default, or TH gear, then switch back to default
			TPStyle="default"
		end
        -- If you want to add more to gear-swap function, then you'll need this code:
            -- elseif (TPStyle=="Accuracy") then
                -- TPStyle = new set name
            -- else
        -- i.e. Copy lines 188-189 and switch the TPStyle name out with the new set name
        -- You will also need to add a sets.aftercast.Engaged."set name" - Copy one of lines 82-84
        add_to_chat(8, "Changing TP Gearset to: " ..TPStyle)

        --After doing the gear change, then switch to the new gear.
        if (player.status=="Engaged") then --If you're engaged
            equip(sets.aftercast[player.status][TPStyle]) --Then equip your current TP Style choice (default, TH, etc)
        else
            equip(sets.aftercast[player.status]) --If you're not engaged, then resort to your current status: Idle, Resting, etc
        end
        equip(sets[weaponMode])
    end

    if (command:lower() == "weapon-swap") then
        if (weaponMode=="staff") then
            weaponMode = "h2h"
        elseif (weaponMode=="h2h") then
            weaponMode = "slashing"
        elseif (weaponMode=="slashing") then
            weaponMode = "piercing"
        elseif (weaponMode=="piercing") then
            weaponMode = "staff"
        end
        equip(sets[weaponMode])
        add_to_chat(8, "Changing weapon style to: " ..weaponMode)
    end

    --Add more custom commands here..
end

--@param spell_element: Element of the spell you're using
--@param spell_skill: Skill of the spell you're using. Recommended spell.skill
function weathercheck(spell_element, spell_skill)
	if not (spell_skill) then spell_skill = null end
	if ((spell_skill=="Elemental Magic") or (spell_skill=="Healing Magic") or (spell_skill=="Enfeebling Magic") or spell_skill=="Blue Magic" or (spell_skill==null)) then
		if spell_element == world.weather_element or spell_element == world.day_element then
			add_to_chat(8,'>> Weather or Day element matches spell element <<')
			equip(sets.Obis[spell_element]) --Equip standard obi, force fallback below
			equip(sets.Obis.AIO) --Force fallback onto Hachirin-no-Obi, just in case individual obis no longer exist
		end
	end
end
