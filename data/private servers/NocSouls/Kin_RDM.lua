include("organizer-lib")

function get_sets()
	include("includes/common")
	-- include("includes/config")
	-- include("includes/common-functions")
	-- include('private servers/'..server..'/common-gearsets')
	-- include('private servers/'..server..'/custom-info')
	--initialise local variables to inherit from master config
	showFCInfo = config.showFastCastInfo
	showSpellInfo = config.showSpellInfo
	showCancelInfo = config.showCancelInfo
	FastCast = 80
	RDMStyle = "Melee"
	TPStyle = "Melee"

	if ((sjob=="BLU") or (sjob=="NIN") or (sjob=="DNC") or (sjob=="THF")) then
		RDMStyle = "DualWield"
	end
	
	init_gear_sets(mjob)
	sets.RDM={}
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

	sets.RDM.midcast={}
	sets.RDM.midcast['EnhancingDuration'] = set_combine(sets.common.midcast.EnhancingDuration, {
		hands=RDM_AF_HANDS,
		feet=RDM_EMPYREAN_FEET
	})

	sets.RDM.midcast['EnfeeblingDuration'] = set_combine(sets.common.midcast.EnfeeblingDuration, {
	})

	sets.RDM.midcast.Cure = {
		head="Iaso Mitra", --11%
		hands="Bokwus Gloves", --13% => 24%
		legs=RDM_AF_LEGS, --11% => 35%
		back="Ghostfyre cape", --6% => 41%
		neck="Phalaina locket", --4% => 45%
		left_ear="Roundel Earring", --5% => 50%
		left_ring="Lebeche Ring",
		right_ring="Sirona's ring"
	}
	sets.RDM.midcast['Refresh'] = set_combine(sets.common.midcast.EnhancingDuration, sets.RDM.midcast.EnhancingDuration, {
		legs=RDM_EMPYREAN_LEGS,
		body=RDM_AF_BODY
	})
	sets.RDM.midcast['Refresh II'] = set_combine(sets.RDM.midcast['Refresh'], {})

	sets.RDM.midcast['Spikes'] = {legs=RDM_RELIC_LEGS}
	sets.RDM.midcast['Blaze Spikes'] = sets.RDM.midcast['Spikes']
	sets.RDM.midcast['Ice Spikes'] = sets.RDM.midcast['Spikes']
	sets.RDM.midcast['Shock Spikes'] = sets.RDM.midcast['Spikes']

	sets.RDM.midcast['MAB'] = set_combine(sets.misc.AllJobs.MAB, {
		head="Leth. Chappel +1",
		body="Gyve Doublet",
		hands="Quauhpilli Gloves",
		legs="Gyve Trousers",
		feet="Vitiation Boots +1",
		waist="Othila Sash",
		right_ring="Strendu Ring",
	})

	sets.RDM.midcast['Divine Magic'] = {}
	sets.RDM.midcast['Healing Magic'] = {}
	sets.RDM.midcast['Enhancing Magic'] = set_combine(sets.RDM.midcast['EnhancingDuration'],{
		body=RDM_RELIC_BODY,
		legs=RDM_AF_LEGS,
		feet=RDM_EMPYREAN_FEET,
		left_ear="Andoaa Earring",
		left_ring={ name="Stikini Ring +1", augments={'"Refresh"+20','"Refresh"+20','"Refresh"+20','"Refresh"+20',}},
	
	})
	sets.RDM.midcast['Enfeebling Magic'] = set_combine(sets.RDM.midcast['EnfeeblingDuration'],{
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
	sets.RDM.midcast['Elemental Magic'] = set_combine(sets.RDM.midcast['MAB'], {})
	sets.RDM.midcast['Dark Magic'] = {}

	sets.RDM.midcast['Helixes'] = set_combine(sets.RDM.midcast['MAB'], sets.common.midcast['Helixes'], {})
	sets.RDM.midcast['Helixes']['Light Arts'] = set_combine(sets.RDM.midcast['Helixes'], {})
    sets.RDM.midcast['Helixes']['Dark Arts'] = set_combine(sets.RDM.midcast['Helixes'], {})

	sets.RDM.midcast.BLU_Physical = set_combine(sets.common.midcast.BLU_Physical,{})
	sets.RDM.midcast.BLU_Buffs = set_combine(sets.common.midcast.BLU_Buffs,{})
	sets.RDM.midcast.BLU_Nukes = set_combine(sets.common.midcast.BLU_Nukes, sets[mjob].midcast['MAB'], {})

	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Melee = set_combine(sets.weapons[mjob][RDMStyle], sets.misc.AllJobs.TP,{
		head="Ayanmo Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Ayanmo Manopolas +2",
		legs="Ayanmo Cosciales +2",
		feet="Ayanmo Gambieras +2",
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},	
	})
	sets.aftercast.Engaged['MEva'] = set_combine(sets.aftercast.Engaged.Melee, {
		head="Atro. Chapeau +2",
		body="Atrophy Tabard +2",
		legs="Atrophy Tights +2",
		feet="Atro. Boots +2",
		right_ring="Purity Ring",
	})


	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Melee, sets.misc.AllJobs['DTCombo'],{
		head=RDM_RELIC_HEAD,
		body=RDM_EMPYREAN_BODY,
		legs="Crimson Cuisses"
	})

	sets.WeaponSkills["Evisceration"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Mercy Stroke"] = set_combine(sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Aeolian Edge"] = set_combine(sets.RDM.midcast['MAB'],{})
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
	sets.WeaponSkills['Savage Blade'] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'],{--50% STR, 50% MND - Equal footing for both
		neck="Imbodla Necklace",
		left_ear="Regal Earring",
		right_ear="Aqua Pearl",
		back="Laic Mantle",
	}) 
	sets.WeaponSkills['Knights of Round'] = {}
	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
	infoLog("Subjob: "..sjob.." - RDM Style: "..RDMStyle)
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
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
	commonMidcastRules(sets, spell.english, spell.skill, spell.action_type)
	weathercheck(spell.element, spell.skill)
end

function aftercast(spell)
	equip(sets.weapons[mjob][RDMStyle])
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	
	customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
	announceSpell(spell.name, spell.target.name, "p")
end

function status_change(new, old)
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
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
		if RDMStyle == "Melee" then
			RDMStyle = "Mage"
		else
			RDMStyle="Melee"
		end
		infoLog("RDM Style is now: " .. RDMStyle.. "!")
		equip(sets.weapons[mjob][RDMStyle])
		if (sets.aftercast[player.status]) then
			equip(sets.aftercast[player.status])
		end
	end

	if command:lower() == "toggle-tp" then
		if TPStyle == "Melee" then
			TPStyle = "MEva"
		else
			TPStyle="Melee"
		end
		infoLog("TP Style is now: " .. TPStyle.. "!")
		if (sets.aftercast[player.status][TPStyle]) then
			equip(sets.aftercast[player.status][TPStyle])
		end
	end

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
