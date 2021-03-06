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

	sets.WeaponSkills = {}
	
	
	sets.precast = {}
	sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
	}
	
	sets.precast.BloodPactDelay = {
		ammo="Sancus Sachet", --BP2 -6
		head="Glyphic Horn +1", --BP -8
		body="Glyphic Doublet +1", --BP2 -2
		hands="Glyphic Bracers +1", --BP -6
		legs="Glyphic Spats +1", -- BP -6
		feet="Glyph. Pigaches +1", --BP2 -1
		back="Tiresias' Cape", --BP -3
	}
	
	sets.midcast = {}
	sets.midcast['Summoning Magic'] = {
		main = "Nirvana",
		sub="Elan Strap",
		ammo = "Sancus Sachet",
		head = "Convoker's Horn +1",
		neck = "Caller's Pendant",
		right_ear = "Tranquility Earring +1",
		body = "Glyphic Doublet +1",
		hands = "Glyphic Bracers +1",
		left_ring = "Varar Ring",
		right_ring = "Varar Ring",
		back="Tiresias's Cape",
		waist = "Regal Belt",
		legs = "Beckoner's Spats",
		feet="Adhara Crackows"		
	}
	sets.midcast['Elemental Magic'] = {
	
	}
	sets.midcast['Enfeebling Magic'] = {
		legs="Adhara Seraweels"
	}
	sets.midcast['Dark Magic'] = {

	}
	
	sets.midcast['Healing Magic'] = {
		legs="Adhara Seraweels"
	}
	
	sets.midcast['Enhancing Magic'] = {
		legs="Shedir Seraweels"

	}
	
	sets.aftercast = {}
	sets.aftercast.Idle = {
		ammo="Sancus Sachet",
		head="Convoker's Horn +1",
		body="Beckoner's Doublet",
		hands="Convo. Bracers +1",
		legs="Convo. Spats +1",
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
		body="Con. Doublet +1",
		legs="Convo. Spats +1",
		feet="Convo. Pigaches +1",
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
	doSetup()
	
end

magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
        'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
        'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy'}

function precast(spell)

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
        equip(sets.precast.FastCast.Default)
    end

	send_command('input /follow Kin')
end

function midcast(spell)  
	cancelBuff(spell.english, spell.cast_time, FastCast)
	
	if sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
	end
	
	if sets.AvatarPerp[spell.name] then
		equip(sets.AvatarPerp[spell.name])
	end
    
	if sets.JobAbility[spell.name] then
		equip(sets.JobAbility[spell.name])
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
	if command:lower() == "bpgo" then
		if (player.target.type == "MONSTER") then
			if (pet.name == "Carbuncle") then
				send_command('input /ja "Holy Mist" <t>')
				infoLog("Target already selected. Executing BP for: "..pet.name)
			elseif (pet.name == "Shiva") then
				send_command('input /ja "Heavenly Strike" <t>')
			elseif (pet.name == "Garuda") then
				send_command('input /ja "Wind Blade" <t>')
			end
			infoLog("Target already selected. Executing BP for: "..pet.name)
		else
			if (pet.name == "Carbuncle") then
				send_command('input /ta <bt>; wait 0.1;input /ja "Holy Mist" <t>')
			elseif (pet.name == "Shiva") then
				send_command('input /ta <bt>; wait 0.1;input /ja "Heavenly Strike" <t>')
			elseif (pet.name == "Garuda") then
				send_command('input /ta <bt>; wait 0.1;input /ja "Wind Blade" <t>')
			end
			infoLog("Target not found. Selecting <bt> and executing BP for: "..pet.name)
		end
	end
end

function doSetup()
	send_command('gs equip sets.aftercast.Idle')
	send_command('input /macro book 1;wait .1;input /macro set 1')
end