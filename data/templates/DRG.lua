function get_sets()
	DRG_AF_HEAD = "Drachen Armet"
	DRG_AF_BODY = "Drachen Mail"
	DRG_AF_HANDS = "Drachen Finger Gauntlets"
	DRG_AF_LEGS = "Drachen Brais"
	DRG_AF_FEET = "Drachen Greaves"
	DRG_RELIC_HEAD = "Wyrm Armet +1"
	DRG_RELIC_BODY = "Wyrm Mail +1"
	DRG_RELIC_HANDS = "Wyrm Finger Gauntlets +1"
	DRG_RELIC_LEGS = "Wyrm Brais +1"
	DRG_RELIC_FEET = "Wyrm Greaves +1"
    -- DRG_AF_HEAD = "Vishap Armet +1"
	-- DRG_AF_BODY = "Vishap Mail +1"
	-- DRG_AF_HANDS = "Vishap Finger Gauntlets +1"
	-- DRG_AF_LEGS = "Vishap Brais +1"
	-- DRG_AF_FEET = "Vishap Greaves +1"
	-- DRG_RELIC_HEAD = "Pteroslaver Armet +1"
	-- DRG_RELIC_BODY = "Pteroslaver Mail +1"
	-- DRG_RELIC_HANDS = "Pteroslaver Finger Gauntlets +1"
	-- DRG_RELIC_LEGS = "Pteroslaver Brais +1"
	-- DRG_RELIC_FEET = "Pteroslaver Greaves +1"
	-- DRG_EMPYREAN_HEAD = "Peltast's Mezail +1"
	-- DRG_EMPYREAN_BODY = "Peltast's Plackart +1"
	-- DRG_EMPYREAN_HANDS = "Peltast's Vambraces +1"
	-- DRG_EMPYREAN_LEGS = "Peltast's Cuissots +1"
	-- DRG_EMPYREAN_FEET = "Peltast's Schynbalds +1"
    DRG_EMPYREAN_HEAD = "Lancer's Mezail +2"
	DRG_EMPYREAN_BODY = "Lancer's Plackart +2"
	DRG_EMPYREAN_HANDS = "Lancer's Vambraces +2"
	DRG_EMPYREAN_LEGS = "Lancer's Cuissots +2"
	DRG_EMPYREAN_FEET = "Lancer's Schynbalds +2"
	
    sets.precast = {}
    sets.midcast = {}
    sets.aftercast = {}
	sets.DRG={}
	sets.MAB = {}

    sets.precast.FastCast = {
        left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
    }

    sets.JobAbility ={}
	sets.JobAbility["Spirit Surge"] = {}
	sets.JobAbility["Call Wyvern"] = {}
	sets.JobAbility["Ancient Circle"] = {legs=DRG_AF_LEGS}
    sets.JobAbility['All Jumps'] = {
		hands=DRG_AF_HANDS,
		feet=DRG_AF_FEET,
		body=DRG_RELIC_BODY
	}
	sets.JobAbility['Jump'] = set_combine(sets.JobAbility['All Jumps'], {})
    sets.JobAbility['High Jump'] = set_combine(sets.JobAbility['All Jumps'], {legs=DRG_RELIC_LEGS})
    sets.JobAbility['Super Jump'] = set_combine(sets.JobAbility['All Jumps'], {})
    sets.JobAbility['Spirit Jump'] = set_combine(sets.JobAbility['All Jumps'], {legs=DRG_EMPYREAN_LEGS, feet = DRG_EMPYREAN_FEET})
    sets.JobAbility['Soul Jump'] = set_combine(sets.JobAbility['All Jumps'], {legs=DRG_EMPYREAN_LEGS})
	sets.JobAbility['Spirit Link'] = {head=DRG_AF_HEAD, hands=DRG_EMPYREAN_HANDS}
	sets.JobAbility['Spirit Bond'] = {}
    sets.JobAbility['Dragon Breaker'] = {}
    sets.JobAbility['Fly High'] = {}

    sets.WeaponSkills = {}
	sets.WeaponSkills.DRG = {}
	sets.WeaponSkills.DRG['WSD Base'] = set_combine(sets.WeaponSkills['AllJobsWS'],{
		hands=DRG_RELIC_HANDS,
		legs = DRG_AF_LEGS,
	})
	sets.WeaponSkills["Camlann's Torment"] = set_combine(sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Drakesbane'] = set_combine(sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Geirskogul'] = set_combine(sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Stardiver'] = set_combine(sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Sonic Thrust'] = set_combine(sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Impulse Thrust'] = set_combine(sets.WeaponSkills.DRG['WSD Base'], {})

    sets.DRG.precast = {}
    sets.DRG.midcast = {}
	sets.DRG.midcast.Cure = {}
    sets.DRG.midcast['Breaths'] = {
        head=DRG_AF_HEAD,

    }
	sets.aftercast = {}
	sets.aftercast.Resting = {}

	sets.aftercast.Engaged = {
        neck = "Drachen Torque",
        left_ear = "Moonshade Earring",
        right_ear = "Insomnia Earring",
        left_ring = "Rajas Ring",
        right_ring = "Ulthalam's Ring",
        body = DRG_EMPYREAN_BODY,
        legs = DRG_EMPYREAN_LEGS,
        hands = DRG_EMPYREAN_HANDS,
        head = DRG_EMPYREAN_HEAD,
        feet = DRG_EMPYREAN_FEET,
        waist = "Crudelis Belt",
        back = "Forager's Mantle",
    }

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged,{})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
end

function pretarget (spell)
	if (((skill == "Healing Magic") or (skill == "Enhancing Magic")) and (targetType == "MONSTER")) then
		change_target("<me>")
		add_to_chat(11, skill.." against a "..targetType.."! Changing targets to self")
	end
end

function precast(spell)
		
	if sets.JobAbility[spell.english] then
		equip(sets.JobAbility[spell.english])
	end

	if sets.WeaponSkills[spell.english] then
		equip(sets.WeaponSkills[spell.english])
	end
	
    if sets.precast[spell.skill] then
        equip(sets.precast[sets.skill])
    end

	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end

    if sets.DRG.precast[spell.english] then
        equip(sets.precast[spell.english])
    end
    if sets.DRG.precast[spell.skill] then
        equip(sets.precast[spell.skill])
    end

	if spell.action_type == "Magic" then
	 	equip(sets.precast.FastCast)
	end

	if (player.hpp < 76) then
		add_to_chat(12,"[Info] HP under 76% - Equipping Healing Breath gear")
		equip(sets.DRG.midcast['Breaths'])
	end
end
function midcast(spell)
	if sets.DRG.midcast[spell.english] then
		equip(sets.DRG.midcast[spell.english])
	elseif sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.DRG.midcast.Cure)
	end

	if sets.DRG.midcast[spell.skill] then
		equip(sets.DRG.midcast[spell.skill])
	elseif sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	
end

function aftercast(spell)
	equip(set_combine(sets.aftercast[player.status]))
end

function status_change(new, old)
	equip(set_combine(sets.aftercast[player.status]))
end

function buff_change(name, gain)

end

function area_change(new,old)

end

function self_command(command)
end
