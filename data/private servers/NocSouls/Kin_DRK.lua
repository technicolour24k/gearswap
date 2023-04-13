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
	sets.WeaponSkills["Quietus"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Entropy"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Dimidiation"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Resolution"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Torcleaver"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Herculean Slash"] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.MAB, {})
	sets.WeaponSkills["Scourge"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})


    sets.DRK.precast = {}
	sets.DRK.midcast = {}
    sets.DRK.precast['Dark Magic'] = set_combine(sets.DRK.midcast['Dark Magic'], {
        head = DRK_RELIC_HEAD
    })

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


	sets.DRK.midcast['Dark Magic'] = set_combine(sets.common.midcast['Dark Magic'], {
		head = DRK_RELIC_HEAD
	})
	
    sets.DRK.midcast.DrainAspir = set_combine(sets.common.midcast.DrainAspir, sets.DRK.midcast['Dark Magic'], {
        hands = DRK_RELIC_HANDS,
    })

    sets.DRK.midcast['Drain'] = set_combine(sets.DRK.midcast.DrainAspir, {})
    sets.DRK.midcast['Aspir'] = set_combine(sets.DRK.midcast.DrainAspir, {})
	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = set_combine(sets.misc.AllJobs.TP,{
        body = "Agony Jerkin +1",
        legs = "Flamma Dirs +2",
        hands = "Macabre Gauntlets +1",
        head = "Flamma Zucchetto +2",
        feet = "Flamma Gambieras +1",
        waist = "Nierenschutz",
    })

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.weapons.DRK[WeaponChoice], sets.aftercast.Engaged[TPStyle],{
		left_ring = "Defending Ring",
		right_ring = "Stikini Ring +1",
		neck="Loricate Torque +1",
		left_ear = "Moonshade Earring"
	})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
	infoLog("[F10] Bound to Toggle Weapons")
	infoLog("[F9] Bound to Toggle TP Gear")
	infoLog("[F12] Bound to status removal")
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

    if sets.DRK.precast[spell.english] then
        equip(sets.precast[spell.english])
    end
    if sets.DRK.precast[spell.skill] then
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
	if player.status == "Engaged" then
		equip(set_combine(sets.aftercast[player.status][TPStyle], sets.weapons.DRK[WeaponChoice]))
	else
		equip(set_combine(sets.aftercast[player.status], sets.weapons.DRK[WeaponChoice]))
	end
	
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
end

function status_change(new, old)
	equip(set_combine(sets.aftercast[player.status][TPStyle], sets.weapons.DRK[WeaponChoice]))
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
		equip(set_combine(sets.aftercast[player.status][TPStyle], sets.weapons.DRK[WeaponChoice]))
	end
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
