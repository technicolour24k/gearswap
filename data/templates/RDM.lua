include("organizer-lib")
TPStyle="default"
enspell_list = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Enlight","Endark"} --Store enspells for easily cancelling
BLU_physical = S{}
BLU_magic = S{}
BLU_buffs = S{}

RDM_AF_HEAD = "Atrophy Chapeau +2"
RDM_AF_BODY = "Atrophy Tabard +2"
RDM_AF_HANDS = "Atrophy Gloves +2"
RDM_AF_LEGS = "Atrophy Tights +2"
RDM_AF_FEET = "Atrophy Boots +2"
RDM_RELIC_HEAD = "Vitiation Chapeau +1"
RDM_RELIC_BODY = "Vitiation Tabard +1"
RDM_RELIC_HANDS = "Vitiation Gloves +1"
RDM_RELIC_LEGS = "Vitiation Tights +1"
RDM_RELIC_FEET = "Vitiation Boots +1"
RDM_EMPYREAN_HEAD = "Lethargy Chappel +1"
RDM_EMPYREAN_BODY = "Lethargy Sayon +1"
RDM_EMPYREAN_HANDS = "Lethargy Gantherots +1"
RDM_EMPYREAN_LEGS = "Lethargy Fuseau +1"
RDM_EMPYREAN_FEET = "Lethargy Houseaux +1"


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

    sets.precast.FastCast = {
		left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
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

	sets.midcast['EnhancingDuration'] = {
		hands=RDM_AF_HANDS,
		feet=RDM_EMPYREAN_FEET
	}

	sets.midcast['EnfeeblingDuration'] = {}
    sets.midcast['Divine Magic'] = {}
	sets.midcast['Healing Magic'] = {} --Mostly status effects
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast['EnhancingDuration'],{})
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['EnfeeblingDuration'],{})
	sets.midcast['Elemental Magic'] = set_combine(sets.MAB,{})
	sets.midcast['Dark Magic'] = {}
	sets.midcast['Summoning Magic'] = {}
	sets.midcast['Ninjutsu'] = {}
	sets.midcast['Singing'] = {}
	sets.midcast['String'] = {}
	sets.midcast['Wind'] = {}
	sets.midcast['Blue Magic'] = {}
	sets.midcast['Blue Magic'].Buffs = set_combine(sets.midcast['Blue Magic'], {})
	sets.midcast['Blue Magic'].Magic = set_combine(sets.midcast['Blue Magic'], {})
	sets.midcast['Blue Magic'].Physical = set_combine(sets.midcast['Blue Magic'], {})
	sets.midcast['Geomancy'] = {}
	sets.midcast['Handbell'] = {}  

	sets.midcast['Refresh'] = set_combine(sets.midcast.EnhancingDuration, {
		legs=RDM_EMPYREAN_LEGS,
		body=RDM_AF_BODY
	})
	sets.midcast['Refresh II'] = set_combine(sets.midcast['Refresh'], {})

	sets.midcast['Spikes'] = {legs=RDM_RELIC_LEGS}
	sets.midcast['Blaze Spikes'] = set_combine(sets.midcast['Spikes'], {})
	sets.midcast['Ice Spikes'] = set_combine(sets.midcast['Spikes'], {})
	sets.midcast['Shock Spikes'] = set_combine(sets.midcast['Spikes'], {})

	sets.midcast.Cure = {
		head="Iaso Mitra", --11%
		hands="Bokwus Gloves", --13% => 24%
		legs=RDM_AF_LEGS, --11% => 35%
		back="Ghostfyre cape", --6% => 41%
		neck="Phalaina locket", --4% => 45%
		left_ear="Roundel Earring", --5% => 50%
		left_ring="Lebeche Ring",
		right_ring="Sirona's ring"
	}
	
	sets.JobAbility["Chainspell"] = {}
	sets.JobAbility["Convert"] = {}
	sets.JobAbility['Composure']= {
		head=RDM_EMPYREAN_HEAD,
		body=RDM_EMPYREAN_BODY,
		hands=RDM_EMPYREAN_HANDS,
		legs=RDM_EMPYREAN_LEGS,
		feet=RDM_EMPYREAN_FEET
	}
	sets.JobAbility["Spontaneity"] = {}
	sets.JobAbility['Saboteur']= {hands=RDM_EMPYREAN_HANDS}
	sets.JobAbility['Stymie'] = {}

    --Fotia set
    sets.WeaponSkills['Fotia'] = {
		neck = "Fotia Gorget",
		waist = "Fotia Belt"
	}
    --Common WS gear - apply to all WS.
	sets.WeaponSkills["Common"] = set_combine(sets.WeaponSkills['Fotia'],{}) --Always equip Fotia gear, then overwrite it
	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.WeaponSkills['Common'],{})
    sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Requiescat"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Chant du Cygne"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Swift Blade"] = set_combine(sets.WeaponSkills['Common'],{})
	sets.WeaponSkills["Vorpal Blade"] = set_combine(sets.WeaponSkills['Common'],{})
    sets.WeaponSkills["Sanguine Blade"] = set_combine(sets.WeaponSkills['Common'],{})
    sets.WeaponSkills["Uriel Blade"] = set_combine(sets.WeaponSkills['Common'],{
		head=RDM_EMPYREAN_HEAD
	})
	sets.WeaponSkills["Savage Blade"] = set_combine(sets.WeaponSkills['Common'],{
		body=RDM_EMPYREAN_BODY
	})
	sets.WeaponSkills["Knights of Round"] = set_combine(sets.WeaponSkills['Common'],{})
	--Need another WS? Add it here with the same setup as above :D


	sets.aftercast.Resting = {}
    
    --Recommend Damage Taken gear for Engaged default
	sets.aftercast.Engaged = {}
    sets.aftercast.Engaged.default={
		main="Almace",
		sub="Genbu's Shield",
		head="Ayanmo Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Ayanmo Manopolas +2",
		legs="Ayanmo Cosciales +2",
		feet="Ayanmo Gambieras +2",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},	
	}
	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.default, {})
	
    --Regen/refresh, move speed, damage taken, etc
    sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.default, {
		head=RDM_RELIC_HEAD,
		body=RDM_EMPYREAN_BODY,
		legs="Crimson Cuisses"
	})

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
    if sets.JobAbility[spell.english] then
		equip(sets.JobAbility[spell.english])
	end

    --Using a WS? If we've got a set for it, let's toss it on.
	if (sets.WeaponSkills[spell.english]) then
		equip(sets.WeaponSkills[spell.english])
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

	if (BLU_physical:contains(spell.english)) then
		equip(sets.midcast['Blue Magic'].Physical)
	elseif(BLU_magic:contains(spell.english)) then
		equip(sets.midcast['Blue Magic'].Magic
	)elseif(BLU_buffs:contains(spell.english)) then
		equip(sets.midcast['Blue Magic'].Buffs)
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
end

function status_change(new, old)
    if (player.status=="Engaged") then --If you're engaged
        equip(sets.aftercast[player.status][TPStyle]) --Then equip your current TP Style choice (default, TH, etc)
	else
        equip(sets.aftercast[player.status]) --If you're not engaged, then resort to your current status: Idle, Resting, etc
    end
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
