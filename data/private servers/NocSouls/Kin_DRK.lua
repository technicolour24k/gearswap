include("organizer-lib")
include("includes/common-functions")
include("includes/config")

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80
local mjob = player.main_job

TPStyle = "Default"
WeaponChoice = "Scythe"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	init_gear_sets(mjob)
	sets.DRK = {}
	sets.MAB = set_combine(sets.misc.AllJobs.MAB, {})
	sets.JobAbility["Blood Weapon"] = {}
	sets.JobAbility["Souleater"] = {head=DRK_AF_HEAD, left_ear="Moonshade Earring"}
	sets.JobAbility["Arcane Circle"] = {feet=DRK_AF_FEET}
	sets.JobAbility['Last Resort'] = {feet=DRK_RELIC_FEET}
	sets.JobAbility['Weapon Bash'] = {hands=DRK_AF_HANDS}
	sets.JobAbility['Nether Void'] = {legs=DRK_EMPYREAN_LEGS}
    sets.JobAbility['Arcane Crest'] = {}
    sets.JobAbility['Scarlet Delirium'] = {}
    sets.JobAbility['Soul Enslavement'] = {}
    sets.JobAbility['Consume Mana'] = {}

	sets.WeaponSkills["Catastrophe"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mandalic Stab"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Rudra's Storm"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		ammo = "Floestone",
		head = THF_EMPYREAN_HEAD,
		body = THF_AF_BODY,
		hands = THF_AF_HANDS,
		legs = THF_EMPYREAN_LEGS,
		feet = THF_RELIC_FEET,
		neck = "Tlamiztli collar",
		back = "Canny Cape",
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.MAB,{})
	sets.WeaponSkills["Exenterator"] = {}

    sets.DRK.precast = {}
    sets.DRK.precast['Dark Magic'] = set_combine(sets.DRK.midcast['Dark Magic'], {
        head = DRK_RELIC_HEAD
    })

    sets.DRK.midcast = {}
	sets.DRK.midcast.Cure = {}
    sets.DRK.midcast.Absorb = {
        head = DRK_AF_HEAD,
        hands = DRK_EMPYREAN_HANDS,
        back = "Chuparrosa Mantle"
    }
    sets.DRK.midcast['Absorb-STR'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-DEX'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-VIT'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-AGI'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-INT'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-MND'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-CHR'] = set_combine(sets.DRK.midcast.Absorb, {})
    sets.DRK.midcast['Absorb-TP'] = set_combine(sets.DRK.midcast.Absorb, {})

    sets.DRK.midcast['Dread Spikes'] = {
        head = DRK_RELIC_HEAD,
        body = DRK_RELIC_BODY,
        hands = DRK_AF_HANDS,
        legs = DRK_AF_LEGS,
        feet = DRK_AF_FEET
    }

    sets.DRK.midcast.DrainAspir = {
        hands = DRK_RELIC_HANDS,
        left_ring={name="Scintillant Ring", augments={'"Drain" and "Aspir" potency +3','Enfb.mag. skill +3','Mag. Acc+7 /Mag. Dmg.+7','System: 1 ID: 1251 Val: 9',}},
		right_ring={name="Scintillant Ring", augments={'"Drain" and "Aspir" potency +2','Enfb.mag. skill +7','Mag. Acc+2 /Mag. Dmg.+2','System: 1 ID: 1251 Val: 8',}}
    }

    sets.DRK.midcast['Drain'] = set_combine(sets.DRK.midcast.DrainAspir, {})
    sets.DRK.midcast['Aspir'] = set_combine(sets.DRK.midcast.DrainAspir, {})

    sets.DRK.midcast['Dark Magic'] = set_combine(sets.common.midcast['Dark Magic'], {
        head = DRK_RELIC_HEAD
    })
	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = {
        body = DRK_AF_BODY,
        legs = DRK_AF_LEGS,
        hands = DRK_AF_HANDS,
        head = DRK_AF_HEAD,
        feet = DRK_AF_FEET,
        neck = "Loricate Torque +1",
        waist = "Nierenschutz",
        ear1 = "Tati Earring",
        ear2 = "Telos Earring",
        ring1 = "Defending Ring",
        ring2 = "Patricius Ring",
        back = "Metallon Mantle",
    }

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.weapons[mjob][WeaponChoice], sets.aftercast.Engaged[TPStyle],{
		left_ring = "Defending Ring",
		right_ring = "Stikini Ring +1",
		neck="Loricate Torque +1",
		left_ear = "Moonshade Earring"
	})

	switchMacroSet(8, 1)
	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
	send_command("@input /echo [F10] Bound to Toggle Weapons;bind F10 gs c toggle-weapons")
	send_command("@input /echo [F9] Bound to Toggle TP Gear;bind F9 gs c togglegear")
	send_command("@input /echo [F12] Bound to status removal;bind F12 gs c status-check")
end

function precast(spell)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
		
	if sets.JobAbility[spell.english] then
		equip(sets.JobAbility[spell.english])
	end

	if sets.WeaponSkills[spell.english] then
		equip(sets.WeaponSkills[spell.english])
	end

	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end

    if sets.precast[spell.skill] then
        equip(sets.precast[sets.skill])
    end

    if sets.precast[mjob][spell.english] then
        equip(sets.precast[spell.english])
    end
    if sets.precast[mjob][spell.skill] then
        equip(sets.precast[spell.skill])
    end

	if spell.action_type == "Magic" then
	 	equip(sets.common.precast.FastCast.Default)
	end
end
function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.DRK.midcast[spell.english] then
		equip(sets.DRK.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.DRK.midcast.Cure)
	end

	if sets.DRK.midcast[spell.skill] then
		equip(sets.DRK.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)end

function aftercast(spell)
	equip(set_combine(sets.aftercast[player.status][TPStyle], sets.weapons[mjob][WeaponChoice]))
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
end

function status_change(new, old)
	equip(set_combine(sets.aftercast[player.status][TPStyle], sets.weapons[mjob][WeaponChoice]))
end

function buff_change(name, gain)

end

function area_change(new,old)

end

function self_command(command)
	if command:lower() == "togglegear" then
		if TPStyle == "Default" then
			TPStyle = "Accuracy"
		elseif TPStyle == "Accuracy" then
			TPStyle = "DTDown"
		else
			TPStyle="Default"
		end
		infoLog("TP Style is now: " .. TPStyle.. "!")
		equip(sets.aftercast.Engaged[TPStyle])
	end

    if command:lower() == "toggle-weapons" then
		if (WeaponChoice == "Scythe") then
			WeaponChoice = "Great Sword"
		else
			WeaponChoice="Scythe"
		end
		infoLog("Weapon is now: " .. WeaponChoice.. "!")
		equip(set_combine(sets.aftercast[player.status][TPStyle], sets.weapons[mjob][WeaponChoice]))
	end

	if command:lower() == "status-check" then
		if (config.oneClickRemedies) then
			clearStatuses()
		end
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end

end
