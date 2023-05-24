include("organizer-lib")
include("includes/common-functions")
include("includes/config")
include('private servers/'..server..'/common-gearsets')
include('private servers/'..server..'/custom-info')

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

TPStyle = {"Default", "Accuracy", "Evasion"}
TPStyleIndex = 1

function get_sets()
	init_gear_sets(mjob)
	sets.NIN = {}
	sets.NIN.precast = {}
	sets.NIN.midcast = {}
    sets.JobAbility['Yonin'] = {}
	sets.JobAbility['Innin'] = {}
	sets.JobAbility['Futae'] = {}
	sets.JobAbility['Issekigan'] = {}
	sets.JobAbility['Mikage'] = {}
	
	sets.WeaponSkills.common = {
		neck = "Fotia Gorget",
	}
	sets.WeaponSkills['Blade: Shun'] = set_combine(sets.WeaponSkills.common, {})
	sets.WeaponSkills['Blade: Hi'] = set_combine(sets.WeaponSkills.common, {})
	sets.WeaponSkills['Blade: Metsu'] = set_combine(sets.WeaponSkills.common, {})
	sets.WeaponSkills['Aeolian Edge'] = set_combine(sets.WeaponSkills.common,{
		left_ear="Hecate's Earring",
		right_ear="Sortiarius Earring",
	})

    sets.NIN.midcast.Cure = {}
	sets.NIN.midcast.Nuke = {
		head="Mochi. Hatsuburi +1",
		body="Gyve Doublet",
		hands="Hattori Tekko +1",
		neck="Stoicheion Medal",
		left_ear={ name="Hecate's Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ear={ name="Sortiarius Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},	
	}

    sets.aftercast = {}        
    sets.aftercast.Resting = {}
    sets.aftercast.Engaged = {}

	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]['Melee'], {
		range="Killer Shortbow",
		head=NIN_AF_HEAD,
		body=NIN_AF_BODY,
		hands=NIN_AF_HANDS,
		legs=NIN_AF_LEGS,
		feet=NIN_AF_FEET,
		neck={ name="Focus Collar", augments={'"Store TP"+2 "Subtle Blow"+2','Crit.hit rate+2','"Dbl.Atk."+2','"Triple Atk."+2',}},
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ear={ name="Moonshade Earring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
		left_ring={ name="Rajas Ring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ring={ name="Epona's Ring", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		back="Moonbeam Cape",
	})
	
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, { })
	sets.aftercast.Engaged.Evasion= set_combine(sets.aftercast.Engaged.Default, { })

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Default, {
		left_ring="Defending Ring",
	})
	

    
	send_command('gs enable all') 
	equip(sets.aftercast.Idle)
	infoLog('[F9] Bound to Default TP Gear')
	infoLog('[F10] Bound to Set Accuracy heavy TP Gear')
	infoLog('[F11] Bound to Set Evasion heavy TP Gear')
end


function precast(spell)
	if sets.JobAbility[spell.english] then
		equip(sets.JobAbility[spell.english])
	end

	if sets.WeaponSkills[spell.english] then
		equip(sets.WeaponSkills[spell.english])
	end
	if sets.precast[spell.english] then
		equip(sets.precast[spell.english])
	end
	
	if spell.action_type == 'Magic' then
        equip(sets.common.precast.FastCast.Default)
    end
end
function midcast(spell)
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.NIN.midcast[spell.english] then
		equip(sets.NIN.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.NIN.midcast.Cure)
	end

	if sets.NIN.midcast[spell.skill] then
		equip(sets.NIN.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end
	
	if (eleWheel_list:contains(spell.english)) then
		equip(sets.NIN.midcast.Nuke)
	end
	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)
end

function aftercast(spell)

	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
end

function status_change(new,old)
end

function buff_change(name,gain)

end

function self_command(command)
	if command:lower() == "default" then
		TPStyle = "Default"
		equip(sets.aftercast.Engaged[TPStyle])
	elseif command:lower() == "accuracy" then
		TPStyle = "Accuracy"
		equip(sets.aftercast.Engaged[TPStyle])
	elseif command:lower() == "evasion" then
		TPStyle = "Evasion"
		equip(sets.aftercast.Engaged[TPStyle])
	end
	infoLog('TP Style is now: '.. TPStyle .. '!')
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
