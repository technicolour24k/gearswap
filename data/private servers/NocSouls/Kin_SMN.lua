include('organizer-lib')
include('includes/common-functions')
include('private servers/'..server..'/common-gearsets')
include('includes/config')

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

function get_sets()
	sets.SMN = {}

	sets.precast.BloodPactDelay = {
		ammo="Sancus Sachet", --BP2 -6
		head="Glyphic Horn +1", --BP -8
		body="Glyphic Doublet +1", --BP2 -2
		hands="Glyphic Bracers +1", --BP -6
		legs="Glyphic Spats +1", -- BP -6
		feet="Glyph. Pigaches +1", --BP2 -1
		back="Tiresias' Cape", --BP -3
	}
	
	sets.SMN.midcast['Summoning Magic'] = {
		main = "Nirvana",
		sub="Elan Strap",
		ammo = "Sancus Sachet",
		head = "Convoker's Horn +2",
		neck = "Caller's Pendant",
		right_ear = "Tranquility Earring +1",
		body = "Beckoner's Doublet +1",
		hands = "Glyphic Bracers +1",
		left_ring = "Varar Ring",
		right_ring = "Varar Ring",
		back="Tiresias's Cape",
		waist = "Regal Belt",
		legs = "Beckoner's Spats",
		feet="Adhara Crackows"		
	}
	sets.SMN.midcast['Elemental Magic'] = {
	
	}
	sets.SMN.midcast['Enfeebling Magic'] = {
		legs="Adhara Seraweels"
	}
	sets.SMN.midcast['Dark Magic'] = {

	}
	
	sets.SMN.midcast['Healing Magic'] = {
		legs="Adhara Seraweels"
	}
	
	sets.SMN.midcast['Enhancing Magic'] = {
		legs="Shedir Seraweels"

	}
	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		ammo="Sancus Sachet",
		head="Convoker's Horn +2",
		body="Beckoner's Doublet +1",
		hands="Convo. Bracers +2",
		legs="Convo. Spats +2",
		feet="Herald's Gaiters",
		neck="Caller's Pendant",
		waist="Regal Belt",
		left_ear={ name="Trq. Earring +1", augments={'"Fast Cast"+3','Pet: Attack+6 Pet: Rng.Atk.+6','Pet: Mag. Acc.+6 Pet: "Mag.Atk.Bns."+6','Pet: "Dbl.Atk."+6 Pet: Crit.hit rate +6',}},
		right_ear={ name="Mache Earring +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ring="Defending Ring",
		right_ring="Varar Ring",
		back="Cheviot Cape",
	}
	
	sets.aftercast.Resting = {

	}

	sets.AvatarPerp = {}
	sets.AvatarPerp.Default = {
		main = "Nirvana", -- -8
		body="Glyphic Doublet +1", -- -5

	}
	sets.AvatarPerp.Carbuncle = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Titan = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Ifrit = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Garuda = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Shiva = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Ramuh = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Leviathan = set_combine(sets.AvatarPerp.Default, {})
	sets.AvatarPerp.Fenrir = set_combine(sets.AvatarPerp.Default, {})
		
	sets.BloodPact = {}
	sets.BloodPact.MagicRage = {
		main="Nirvana",
		sub="Elan Strap",
		ammo="Sancus Sachet",
		head="Glyphic Horn +1",
		body="Con. Doublet +3",
		legs="Convo. Spats +2",
		feet="Convo. Pigaches +2",
		waist="Regal Belt",
		left_ear={ name="Trq. Earring +1", augments={'"Fast Cast"+3','Pet: Attack+6 Pet: Rng.Atk.+6','Pet: Mag. Acc.+6 Pet: "Mag.Atk.Bns."+6','Pet: "Dbl.Atk."+6 Pet: Crit.hit rate +6',}},
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back="Tiresias' Cape",
	}
	sets.BloodPact.PhysicalRage = {}
	sets.BloodPact.DebuffWard = {}
	sets.BloodPact.PartyWard = {}
	
	sets.JobAbility = {}
	sets.JobAbility.Release = sets.aftercast.Idle

	bloodpacts = {}
	bloodpacts['Carbuncle'] = {}
	bloodpacts['Carbuncle']['bp-rage-1']="Holy Mist"
	bloodpacts['Carbuncle']['bp-rage-2']="Meteorite"
	bloodpacts['Carbuncle']['bp-ward']="Healing Ruby II"
	bloodpacts['Shiva'] = {}
	bloodpacts['Shiva']['bp-rage-1']="Rush"
	bloodpacts['Shiva']['bp-rage-2']="Heavenly Strike"
	bloodpacts['Shiva']['bp-ward']="Sleepga"
	bloodpacts['Ifrit'] = {}
	bloodpacts['Ifrit']['bp-rage-1']="Conflag Strike"
	bloodpacts['Ifrit']['bp-rage-2']="Meteor Strike"
	bloodpacts['Ifrit']['bp-ward']="Crimson Howl"
	bloodpacts['Garuda'] = {}
	bloodpacts['Garuda']['bp-rage-1']="Predator Claws"
	bloodpacts['Garuda']['bp-rage-2']="Wind Blade"
	bloodpacts['Garuda']['bp-ward']="Whispering Wind"
	bloodpacts['Leviathan'] = {}
	bloodpacts['Leviathan']['bp-rage-1']="Grand Fall"
	bloodpacts['Leviathan']['bp-rage-2']="Spinning Dive"
	bloodpacts['Leviathan']['bp-ward']="Spring Water"
	bloodpacts['Titan'] = {}
	bloodpacts['Titan']['bp-rage-1']="Crag Throw"
	bloodpacts['Titan']['bp-rage-2']="Geocrush"
	bloodpacts['Titan']['bp-ward']="Earthen Ward"
	bloodpacts['Ramuh'] = {}
	bloodpacts['Ramuh']['bp-rage-1']="Volt Strike"
	bloodpacts['Ramuh']['bp-rage-2']="Thunderspark"
	bloodpacts['Ramuh']['bp-ward']="Shock Squall"
	bloodpacts['Fenrir'] = {}
	bloodpacts['Fenrir']['bp-rage-1']="Lunar Bay"
	bloodpacts['Fenrir']['bp-rage-2']="Impact"
	bloodpacts['Fenrir']['bp-ward']="Heavenward Howl"
	bloodpacts['Diabolos'] = {}
	bloodpacts['Diabolos']['bp-rage-1']="Blindside"
	bloodpacts['Diabolos']['bp-rage-2']="Night Terror"
	bloodpacts['Diabolos']['bp-ward']="Nightmare"
	bloodpacts['Cait Sith'] = {}
	bloodpacts['Cait Sith']['bp-rage-1']="Regal Gash"
	bloodpacts['Cait Sith']['bp-rage-2']="Mewing Lullaby"
	bloodpacts['Cait Sith']['bp-ward']="Eerie Eye"
	bloodpacts['Siren'] = {}
	bloodpacts['Siren']['bp-rage-1']="Hysteric Assault"
	bloodpacts['Siren']['bp-rage-2']="Tornado II"
	bloodpacts['Siren']['bp-ward']="Wind's Blessing"

	doSetup()
	
end

magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
        'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
        'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy'}
		
autoSATActions = S{'Assault','Release','Retreat','Apogee','Composure', "Avatar's Favor", "Protect V", "Shell V", "Blink", "Stoneskin", "Aquaveil", "Phalanx", "Haste II", "Refresh II", "Blaze Spikes", "Ice Spikes"}


function precast(spell)

	if (autoSATActions:contains(spell.english)) then
		send_command('send Hit ' ..spell.english)
		send_command('send Zoku ' ..spell.english)
	end
	if (magicalRagePacts:contains(spell.english)) then
		send_command('send Hit gs c bpgo')
		send_command('send Zoku gs c bpgo')
	end
	if spell.type == 'BloodPactRage' or spell.type == 'BloodPactWard' then
		equip(sets.precast.BloodPactDelay)
	end
	
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
		if spell.skill == "Summoning Magic" then
			if (spell.english == "Carbuncle") then
				send_command('send Hit shiva')
				send_command('send Zoku shiva')
			else
				send_command('send Hit carbuncle')
				send_command('send Zoku carbuncle')
			end
				--send_command('wait ' ..spell.cast_time.. ';sat youattack Hit '..spell.english)
		end
    end

end

function midcast(spell)  
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.SMN.midcast[spell.english] then
		equip(sets.SMN.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.SMN.midcast.Cure)
	end

	if sets.SMN.midcast[spell.skill] then
		equip(sets.SMN.midcast[spell.skill])
	elseif sets.common.midcast[spell.skill] then
		equip(sets.common.midcast[spell.skill])

	end
	if (enspell_list:contains(spell.english)) then
		equip(sets.common.midcast.Enspell)
	end
	if (conserveMP_list:contains(spell.english)) then
		equip(sets.common.midcast.ConserveMP)
	end

	if sets.AvatarPerp[spell.name] then
		equip(sets.AvatarPerp[spell.name])
	end
	
	if spell.type == 'BloodPactRage' then
		if magicalRagePacts:contains(spell.english) then
			equip(sets.BloodPact.MagicRage)
		else
			equip(sets.BloodPact.PhysicalRage)
		end
	elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
		equip(sets.BloodPact.DebuffWard)
	else
		equip(sets.BloodPact.PartyWard)
	end

	customInfoCheckMidcast(spell.name, spell.tp_cost, spell.mp_cost)

end

function aftercast(spell)
	if pet.isvalid and not pet_midcast then
		if sets.AvatarPerp[pet.name] then
			equip(sets.AvatarPerp[pet.name])
		else
			equip(sets.AvatarPerp.Default)
		end
	else
		equip(sets.aftercast.Idle)
	end
end

function pet_midcast(spell)
    if magicalRagePacts:contains(spell.english) then
		equip(sets.BloodPact.MagicRage)
		infoLog("Found Magic Rage: " ..spell.english)
	else
		equip(sets.BloodPact.PhysicalRage)
		infoLog("Found Physical Rage: "..spell.english)
	end
end


function pet_aftercast(spell)
	if pet.isvalid then
		if sets.AvatarPerp[pet.name] then
			equip(sets.AvatarPerp[pet.name])
		else
			equip(sets.AvatarPerp.Default)
		end
	else
		equip(sets.aftercast.Idle)
	end

end

function status_change(new,old)
	if new == 'Resting' then
        equip(sets.aftercast.Resting)
	end
	if new == 'Idle' then
		equip(sets.aftercast.Idle)
	end
end

function buff_change(name,gol,tab)

end

function self_command(command)
	if command:lower() == "bp-rage-1" then
		send_command('input /ja "'..bloodpacts[pet.name]['bp-rage-1']..'" <t>')
		debugLog('Getting '..pet.name..' to use '..bloodpacts[pet.name]['bp-rage-1'])
	end
	if command:lower() == "bp-rage-2" then
		send_command('input /ja "'..bloodpacts[pet.name]['bp-rage-2']..'" <t>')
		debugLog('Getting '..pet.name..' to use '..bloodpacts[pet.name]['bp-rage-2'])
		
	end
	if command:lower() == "bp-ward" then
		send_command('input /ja "'..bloodpacts[pet.name]['bp-ward']..'" <st>')
		debugLog('Getting '..pet.name..' to use '..bloodpacts[pet.name]['bp-ward']..'on <lastst>')
	end
	common_self_command(command)
end

function doSetup()
	equip(sets.aftercast.Idle)
end
