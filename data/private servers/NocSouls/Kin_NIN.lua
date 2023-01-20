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
	local mjob = player.main_job
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
		ammo="Yetshila +1",
		head="Pill. Bonnet +3",
		body="Pillager's Vest +3",
		hands="Pill. Armlets +3",
		legs="Pill. Culottes +3",
		feet="Plun. Poulaines +1",
		neck="Tlamiztli collar",
		back="Laic Mantle",
		waist="Windbuffet belt +1",
		left_ear="Mache Earring +1",
		right_ear="Mache Earring +1",
		left_ring="Mars's Ring",
		right_ring="Epona's Ring",
	})
	
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, { })
	sets.aftercast.Engaged.Evasion= set_combine(sets.aftercast.Engaged.Default, { })

	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged[TPStyle[TPStyleIndex]], {
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
	if spell.english == "Sneak Attack" then
		infoLog("<<Sneak Attack>>")
		equip (sets.precast['Sneak Attack'])
	elseif spell.english == "Trick Attack" then
		infoLog("<<Trick Attack>>")
		equip (sets.precast['Trick Attack'])
	else
	end
end

function status_change(new,old)
end

function buff_change(name,gain)

	if name == "Trick Attack" and gain == "false" then
			equip(sets.aftercast.Idle)
	elseif name == "Sneak Attack" and gain == "false" then
		if player.status == 'Idle' then
			equip_idle_set()
		elseif sets.aftercast[player.status][TPStyle[TPStyleIndex]] then
			equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]],sets.aftercast)
		else
			equip(sets.aftercast.Idle,sets.aftercast)
		end
	end
end

function self_command(command)
	if command:lower() == "default" then
		TPStyleIndex = 1
		infoLog('TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "accuracy" then
		TPStyleIndex = 2
		infoLog('TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "evasion" then
		TPStyleIndex = 3
		infoLog('TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	end
	
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]])
	else
		equip(sets.aftercast[player.status])
	end
	common_self_command(command)
end
