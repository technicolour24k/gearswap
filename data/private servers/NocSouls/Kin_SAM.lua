include('organizer-lib')
include('includes/common-functions')
include('includes/config')

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

TPStyle = {"Default", "Accuracy", "DT"}
TPStyleIndex = 1

WeaponStyle = "Great Katana"


function get_sets()
	local mjob = player.main_job
	init_gear_sets(mjob)
	include('private servers/'..server..'/common-gearsets')
	sets.aftercast.Engaged = set_combine(sets.weapons[mjob][WeaponStyle], {
		head="Wakido Kabuto +2",
		body="Wakido Domaru +2",
		hands="Wakido Kote +2",
		legs="Wakido Haidate +2",
		feet="Wakido Sune. +2",
		neck="Tlamiztli Collar",
		waist="Dynamic Belt +1",
		left_ear="Tati Earring",
		right_ear="Tati Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back="Laic Mantle"
	})
	
	sets.aftercast.Idle = set_combine(sets.weapons[mjob][WeaponStyle], sets.aftercast.Engaged, {
		head = "Wakido Kabuto +2",
	})

	sets.JobAbilities = {}
	sets.JobAbilities['Meditate'] = {
		head = "Wakido Kabuto +2",
		hands = "Sakonji Kote +1"
	}
	sets.JobAbilities['Sekkanoki'] = {
		hands = "Unkai Kote +2"
	}
	sets.JobAbilities['Hasso'] = {
		body = "Wakido Kote +2",
		legs = "Unkai Haidate +2",
		feet = "Wakido Sune-Ate +2"
	}
	sets.JobAbilities['Seigan'] = {
		head = "Unkai Kabuto +2",
	}
	sets.JobAbilities['Third Eye'] = {
		head = "Sakonji Haidate +1",
	}

	sets.WeaponSkills = {}
	sets.WeaponSkills.default = {
		neck = "Snow Gorget",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
		left_ring = "Mars's Ring",
		right_ring = "Ulthalam's Ring",
		feet = "Sakonji Sune-Ate +1"
	}


	switchMacroSet(4,1)
	send_command('gs enable all') 
	send_command('gs equip sets.aftercast.Idle')
	send_command('input /echo [F9] Bound to Default TP Gear;bind F9 gs c default')
	send_command('input /echo [F10] Bound to Set Accuracy heavy TP Gear;bind F10 gs c accuracy')
	send_command('input /echo [F11] Bound to Set Damage Taken- TP Gear;bind F11 gs c DT')
	send_command('input /echo [F12] Bound to toggle weapons;bind F12 gs c weapontoggle')

	disable('main','sub')	
	
end

function precast(spell)
	if (sets.JobAbilities[spell.english]) then
		equip (sets.JobAbilities[spell.english])
	end
	
	if (sets.WeaponSkills[spell.english]) then
		equip(sets.WeaponSkills[spell.english])
	end
	
	if ((spell.english == "Seigan") or (spell.english == "Hasso")) then	
		FastCast = 50
	end
	
	if spell.action_type == 'Magic' then
        equip(sets.precast.FastCast.Default)
    end
end

function midcast(spell)  
    cancelBuff(spell.english, spell.cast_time, FastCast)
	
	if sets.midcast[spell.english] then
		equip(sets.midcast[spell.english])
	elseif string.find(spell.english,'Cur') and spell.english ~='Cursna' then 
        equip(sets.midcast.Cure)
	end

	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.midcast.Enspell)
	end
end

function aftercast(spell)
	equipGearByState()
end

function status_change(new,old)
    equipGearByState()
end

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "default" then
		TPStyleIndex = 1
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "accuracy" then
		TPStyleIndex = 2		
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "DT" then
		TPStyleIndex = 3
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	end
	
	if command:lower() == "weapontoggle" then
		if (WeaponStyle == "Great Katana") then
			WeaponStyle = "Archery"
		elseif (WeaponStyle == "Archery") then
			WeaponStyle = "Polearm"
		else
			WeaponStyle = "Great Katana"
		end
		add_to_chat(8, 'TP Style is now: ' ..WeaponStyle..'!')
		equip(sets.weapons[mjob][WeaponStyle])
	end
			
	if player.status == "Engaged" then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]])
	else
		equip(sets.aftercast[player.status])
	end
end