include("organizer-lib")
include("includes/common-functions")
include("includes/config")

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

TPStyle = "Default"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	local mjob = player.main_job
	init_gear_sets(mjob)
	sets.MNK={}
	sets.MNK.midcast={}
	
	sets.MAB = set_combine(sets.misc.AllJobs.MAB, {
		
	})
	sets.JobAbility["Hundred Fists"] = {}
	sets.JobAbility["Boost"] = {}
	sets.JobAbility["Focus"] = {head=MNK_AF_HEAD}
	sets.JobAbility['Dodge'] = {}
	sets.JobAbility['Chakra'] = {
		body=MNK_AF_BODY,
		hand=MNK_RELIC_HANDS,
	}
	sets.JobAbility['Counterstance'] = {feet=MNK_RELIC_FEET}
	sets.JobAbility['Jump'] = {}
	sets.JobAbility['Chi Blast'] = {}
	sets.JobAbility['Formless Strikes'] = {}
	sets.JobAbility['Footwork'] = {}
	sets.JobAbility['Perfect Counter'] = {}
	sets.JobAbility['Impetus'] = {}
	sets.JobAbility['Inner Strength'] = {}

	sets.WeaponSkills["Spinning Attack"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Tornado Kick"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Victory Smite"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Shijin Spiral"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})

	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.aftercast.Engaged = {
		head=MNK_AF_HEAD,
		body=MNK_AF_BODY,
		hands=MNK_RELIC_HANDS,
		legs=MNK_RELIC_LEGS,
		feet=MNK_RELIC_FEET,
		ammo="Cheruski Needle",
		neck="Loricate Torque +1",
		waist={ name="Black Belt" },
		left_ear={ name="Moonshade Earring" },
		right_ear={ name="Stamina Earring +1" },
		left_ring={ name="Rajas Ring" },
		right_ring="Epona's Ring",
		back={ name="Moonbeam Cape"},
	}

	sets.aftercast.Engaged.TH = set_combine(sets.aftercast.Engaged, sets.TH)
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged, {})
	sets.aftercast.Engaged.Evasion = set_combine(sets.aftercast.Engaged, {})

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, sets.misc.AllJobs['DTCombo'],{
		right_ring = "Stikini Ring +1",
		feet = "Herald's Gaiters",
		right_ear = "Moonshade Earring"
	})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")

end

function pretarget (spell)
	confirmTarget(spell.skill,spell.target.type)
end

function precast(spell)
	enemyImmunityCheck(spell.target.name,spell.english)
	customInfoCheckPrecast(spell.name, spell.tp_cost, spell.mp_cost)
	commonPrecastRules(sets, spell.english,spell.skill, spell.action_type)
end
function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.MNK.midcast[spell.english] then
		equip(sets.MNK.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.MNK.midcast.Cure)
	end

	if sets.MNK.midcast[spell.skill] then
		equip(sets.MNK.midcast[spell.skill])
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
	equip(sets.aftercast[player.status])
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	equip(sets.aftercast[player.status])
end

function self_command(command)
	equip(sets.aftercast[player.status])
	common_self_command(command)
end
