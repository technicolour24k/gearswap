include("organizer-lib")
TPStyle="default"
enspell_list = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Enlight","Endark"} --Store enspells for easily cancelling


function get_sets()
    --Generic sets setup
	sets={}
    sets.precast = {}
	sets.midcast = {}
    sets.aftercast = {}
    sets.JobAbility = {}
    sets.WeaponSkills = {}
    sets.TH = {}
    sets.MAB = {}

    sets.precast.FastCast = {}
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
	
	sets.JobAbility["Mighty Strikes"] = {}
	sets.JobAbility["Provoke"] = {}
	sets.JobAbility["Berserk"] = {}
    sets.JobAbility["Defender"] = {}
	sets.JobAbility['Warcry'] = {}
	sets.JobAbility['Aggressor'] = {}
	sets.JobAbility['Warrior\'s Charge'] = {}
	sets.JobAbility["Tomahawk"] = {}
	sets.JobAbility['Retaliation'] = {}
	sets.JobAbility['Restraint'] = {}
	sets.JobAbility['Blood Rage'] = {}
    sets.JobAbility['Brazen Rush'] = {}

    sets.WeaponSkills = {}
    --Fotia set
    sets.WeaponSkills['Fotia'] = {
		neck = "Fotia Gorget",
		waist = "Fotia Belt"
	}
    --Common WS gear - apply to all WS.
	sets.WeaponSkills["Common"] = set_combine(sets.WeaponSkills['Fotia'],{})
	sets.WeaponSkills["Upheavel"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Ukko\'s Fury"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Fell Cleave"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["King\'s Justice"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Metatron Torment"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Steel Cyclone"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Full Break"] = set_combine(sets.WeaponSkills['Common'],{})

	sets.midcast.Cure = {}

	sets.aftercast.Resting = {}
    
    --Recommend Damage Taken gear
	sets.aftercast.Engaged = {}
    sets.aftercast.Engaged.default={}
	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.default, {})
	
    --Regen, move speed, etc
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
    if (player.status=="Engaged") then
        equip(sets.aftercast[player.status][TPStyle])
    else
        equip(sets.aftercast[player.status])
    end
end

function status_change(new, old)
    if (player.status=="Engaged") then
        equip(sets.aftercast[player.status][TPStyle])
    else
        equip(sets.aftercast[player.status])
    end
end

function buff_change(name, gain)

end

function self_command(command)
    if (command:lower() == "gear-swap") then
        if (TPStyle == "default") then
			TPStyle = "TH"
		elseif (TPStyle == "TH") then
			TPStyle="Accuracy"
        else
			TPStyle="default"
		end
        add_to_chat(8, "Changing TP Gearset to: " ..TPStyle)

        if (player.status=="Engaged") then
            equip(sets.aftercast[player.status][TPStyle])
        else
            equip(sets.aftercast[player.status])
        end
    end

    --Add more here..    
end

--@param spell_element: Element of the spell you're using
--@param spell_skill: Skill of the spell you're using. Recommended spell.skill
function weathercheck(spell_element, spell_skill)
	if not (spell_skill) then spell_skill = null end
	if ((spell_skill=="Elemental Magic") or (spell_skill=="Healing Magic") or (spell_skill=="Enfeebling Magic") or spell_skill=="Blue Magic" or (spell_skill==null)) then
		if spell_element == world.weather_element or spell_element == world.day_element then
			infoLog('>> Weather or Day element matches spell element <<')
			equip(sets.Obis[spell_element]) --Equip standard obi, force fallback below
			equip(sets.Obis.AIO) --Force fallback onto Hachirin-no-Obi, just in case individual obis no longer exist
		end
	end
end
