include("organizer-lib")
include("includes/common-functions")
include("includes/config")

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

RDMStyle = "Melee"

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')
	local mjob = player.main_job
	init_gear_sets(mjob)
	
	
	sets.MAB = set_combine(sets.misc.AllJobs.MAB, {
		head="Wayfarer Circlet",
		waist = "Aquiline Belt",
		legs = "Limbo Trousers"
	})
	sets.JobAbility={}
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

	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.MAB,{})
	sets.WeaponSkills["Exenterator"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})

	--FTP Replicating WS
	sets.WeaponSkills['Requiescat'] = set_combine(sets.WeaponSkills['Fotia'],sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Chant du Cygne'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Swift Blade'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills['Vorpal Blade'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	-- MAB modded WS
	sets.WeaponSkills['Sanguine Blade'] = set_combine(sets.misc.AllJobs.MAB, {})
	sets.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobs.MAB, {})
	-- Standard mods
	sets.WeaponSkills['Savage Blade'] = set_combine(sets.WeaponSkills.default,{ })
	sets.WeaponSkills['Knights of Round'] = {}

	sets.midcast.RDM={}
	sets.midcast.RDM['EnhancingDuration'] = set_combine(sets.midcast.EnhancingDuration, {
		hands=RDM_AF_HANDS,
		feet=RDM_EMPYREAN_FEET
	})

	sets.midcast.RDM['EnfeeblingDuration'] = set_combine(sets.midcast.EnfeeblingDuration, {
	})

	sets.midcast.Cure = {}
	sets.midcast['Refresh'] = set_combine(sets.midcast.EnhancingDuration, sets.midcast.RDM.EnhancingDuration, {
		legs=RDM_EMPYREAN_LEGS,
		body=RDM_AF_BODY
	})
	sets.midcast['Refresh II'] = set_combine(sets.midcast['Refresh'], {})

	sets.midcast['Spikes'] = {legs=RDM_RELIC_LEGS}
	sets.midcast['Blaze Spikes'] = sets.midcast['Spikes']
	sets.midcast['Ice Spikes'] = sets.midcast['Spikes']
	sets.midcast['Shock Spikes'] = sets.midcast['Spikes']

	sets.midcast.RDM['MAB'] = set_combine(sets.misc.AllJobs.MAB, {
		head="Leth. Chappel +1",
		body="Gyve Doublet",
		hands="Quauhpilli Gloves",
		legs="Gyve Trousers",
		feet="Vitiation Boots +1",
		waist="Othila Sash",
		right_ring="Strendu Ring",
	})

	sets.midcast.RDM['Divine Magic'] = {}
	sets.midcast.RDM['Healing Magic'] = {}
	sets.midcast.RDM['Enhancing Magic'] = set_combine(sets.midcast.RDM['EnhancingDuration'],{
		body=RDM_RELIC_BODY,
		legs=RDM_AF_LEGS,
		feet=RDM_EMPYREAN_FEET,
		left_ear="Andoaa Earring",
		left_ring={ name="Stikini Ring +1", augments={'"Refresh"+20','"Refresh"+20','"Refresh"+20','"Refresh"+20',}},
	
	})
	sets.midcast.RDM['Enfeebling Magic'] = set_combine(sets.midcast.RDM['EnfeeblingDuration'],{
		ammo={ name="Erlene's Notebook", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		head=RDM_AF_HEAD,
		body=RDM_EMPYREAN_BODY,
		hands=RDM_EMPYREAN_HANDS,
		legs=RDM_AF_LEGS,
		feet=RDM_RELIC_FEET,
		neck={ name="Stoicheion Medal", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		left_ear="Regal Earring",
		right_ear={ name="Moonshade Earring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
		back={ name="Izdubar Mantle", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
	
	})
	sets.midcast.RDM['Elemental Magic'] = set_combine(sets.midcast.RDM['MAB'], {})
	sets.midcast.RDM['Dark Magic'] = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {
		ammo={ name="Yetshila +1", augments={'"Triple Atk."+2','"Triple Atk."+2','Crit.hit rate+5','Crit.hit rate+5',}},
		head=RDM_AF_HEAD,
		body=RDM_AF_BODY,
		hands=RDM_AF_HANDS,
		legs=RDM_AF_LEGS,
		feet=RDM_AF_FEET,
		neck={ name="Loricate Torque +1", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear="Andoaa Earring",
		right_ear="Cessance Earring",
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
		back={ name="Laic Mantle", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
	
	}

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, sets.misc.AllJobs['DTCombo'],{
		head=RDM_RELIC_HEAD,
		body=RDM_EMPYREAN_BODY,
		legs="Crimson Cuisses"
	})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")

	disable("main", "sub")
end

function pretarget (spell)
	confirmTarget(spell.skill,spell.target.type)
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

	if spell.action_type == "Magic" then
		equip(sets.precast.FastCast.Default)
	end
end
function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if (conserveMP_list:contains(spell.english)) then
		equip(sets.midcast.ConserveMP)
	end

	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.midcast.Cure)
	end
	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.midcast.Enspell)
	end

	if (sets.midcast.RDM[spell.english]) then
		equip(sets.midcast.RDM[spell.english])
	end
	if (sets.midcast.RDM[spell.skill]) then
		equip(sets.midcast.RDM[spell.skill])
	end

	weathercheck(spell.element)
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

function aftercast(spell)
	equip(sets.weapons.RDM[RDMStyle])
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status])
	else
		equip(sets.aftercast[player.status])
	end
	
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][RDMStyle])
	else
		equip(sets.aftercast[player.status])
	end
end

function buff_change(name, gain)

end

function area_change(new,old)

end

function self_command(command)

	if command:lower() == "togglegear" then
		send_command("gs enable sub")
		if RDMStyle == "Melee" then
			RDMStyle = "Mage"
		else
			RDMStyle="Melee"
		end
		infoLog("RDM Style is now: " .. RDMStyle.. "!")
		equip(sets.weapons.RDM[RDMStyle])
		if (sets.aftercast[player.status]) then
			equip(sets.aftercast[player.status])
		end
	end

	if command:lower() == "status-check" then
		if (config.oneClickRemedies) then
			clearStatuses()
		end
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][RDMStyle])
	else
		equip(sets.aftercast[player.status])
	end

end
