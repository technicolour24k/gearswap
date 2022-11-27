include("organizer-lib")
include("includes/config")
include('private servers/'..server..'/common-gearsets')
include("includes/common-functions")

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

TPStyle = "Default"

function get_sets()
	include('private servers/'..server..'/custom-info')
	local mjob = player.main_job
	init_gear_sets(mjob)
	sets.BRD={}
	sets.BRD.midcast = {}
	
	sets.BRD.TH = {
		sub = "Sandung",
		hands = THF_RELIC_HANDS,
		feet = THF_EMPYREAN_FEET
	}
	sets.BRD.MAB = set_combine(sets.misc.AllJobs.MAB, {
		head="Wayfarer Circlet",
		waist = "Aquiline Belt",
		legs = "Limbo Trousers"
	})
	sets.JobAbility["Perfect Dodge"] = {}
	sets.JobAbility["Sneak Attack"] = {}
	sets.JobAbility["Trick Attack"] = {}
	sets.JobAbility['Flee'] = {feet = THF_AF_FEET}
	sets.JobAbility['Accomplice'] = {head = THF_EMPYREAN_HEAD}
	sets.JobAbility['Collaborator'] = {head = THF_EMPYREAN_HEAD}

	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Dancing Edge"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mandalic Stab"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Rudra's Storm"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		ammo = "Fire Bomblet",
		head = THF_EMPYREAN_HEAD,
		body = THF_AF_BODY,
		hands = THF_AF_HANDS,
		legs = THF_EMPYREAN_LEGS,
		feet = THF_RELIC_FEET,
		back = "Canny Cape",
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.BRD.MAB,{})
	sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

	sets.BRD.midcast.Cure = {}

	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]["Daggers"], sets.misc.AllJobs.TP,{
		head=THF_AF_HEAD,
		body=THF_EMPYREAN_BODY,
		hands=THF_AF_HANDS,
		legs=THF_EMPYREAN_LEGS,
		feet="Savateur's Gaiters",
		neck="Loricate Torque +1",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
	})

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged.Default, sets.BRD.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged.Default, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged[TPStyle], sets.misc.AllJobs['DTCombo'],{
		right_ring = "Stikini Ring +1",
		feet = THF_AF_FEET,
		right_ear = "Moonshade Earring"
	})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
end

function pretarget (spell)
	confirmTarget(spell.skill,spell.target.type)
end

function precast(spell)

end
function midcast(spell)
	if (spellContains(spell.name, "Threnody")) then
        equip(sets.common.midcast.Enspell)
    end
end

function aftercast(spell)

end

function status_change(new, old)

end

function buff_change(name, gain)

end

function area_change(new,old)

end

function self_command(command)

end
