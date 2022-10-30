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
WeaponChoice = "Polearm"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	init_gear_sets(mjob)
	
	sets.DRG={}
	sets.MAB = set_combine(sets.misc.AllJobs.MAB, {})
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

	sets.WeaponSkills.DRG = {}
	sets.WeaponSkills.DRG['WSD Base'] = {
		hands=DRG_RELIC_HANDS,
		legs = DRG_AF_LEGS,
	}
	sets.WeaponSkills["Camlann's Torment"] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Drakesbane'] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Geirskogul'] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Stardiver'] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Sonic Thrust'] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.WeaponSkills.DRG['WSD Base'], {})
	sets.WeaponSkills['Impulse Thrust'] = set_combine(sets.WeaponSkills['AllJobsWS'], sets.WeaponSkills.DRG['WSD Base'], {})

    sets.DRG.Precast = {}

    sets.DRG.midcast = {}
	sets.DRG.midcast.Cure = {}

	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = {
        body = DRG_AF_BODY,
        legs = DRG_AF_LEGS,
        hands = DRG_AF_HANDS,
        head = DRG_AF_HEAD,
        feet = DRG_AF_FEET,
        neck = "Loricate Torque +1",
        waist = "Nierenschutz",
		ear1 = "Tati Earring",
        ear2 = "Telos Earring",
		ring1 = "Defending Ring",
        ring2 = "Stikini Ring +1",
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
end

function precast(spell)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
		
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

	if sets.DRG.midcast[spell.english] then
		equip(sets.DRG.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.DRG.midcast.Cure)
	end

	if sets.DRG.midcast[spell.skill] then
		equip(sets.DRG.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

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
	common_self_command(command)

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

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end

end
