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
	sets.MNK.precast ={}
	sets.MNK.midcast = {}
	sets.aftercast = {}
	sets.aftercast.Resting = {}
	sets.aftercast.Engaged = {}

	sets.WeaponSkills["Spinning Attack"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Tornado Kick"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Victory Smite"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {})
	sets.WeaponSkills["Shijin Spiral"] = set_combine(sets.WeaponSkills['Fotia'], sets.WeaponSkills['AllJobsWS'], {
		waist = "Windbuffet belt +1",
		left_ear = "Mache Earring +1",
		right_ear = "Mache Earring +1",
	})
	sets.aftercast.Engaged.Default = {
		main="Blurred Claws",
		ammo={ name="Staunch Tathlum", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
		head="Mummu Bonnet +2",
		body="Qaaxo Harness",
		hands={ name="Savage Gauntlets", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck={ name="Loricate Torque +1", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		waist={ name="Windbuffet Belt +1", augments={'"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2','"Triple Atk."+2',}},
		left_ear="Etiolation Earring",
		right_ear={ name="Telos Earring", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Purity Ring",
		back={ name="Moonbeam Cape", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
	}

	sets.aftercast.Idle = set_combine(sets.misc.AllJobs['DTCombo'],{
        
	})

	send_command("gs enable all")
	send_command("gs equip sets.aftercast.Idle")
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
		equip(sets.common.precast.FastCast.Default)
	end
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

    local lvl = player.main_job_level

    if player.status == "Engaged" then
        if (lvl < 30) then
            equip(sets.misc.AllJobs['Lv1'])
        elseif (lvl < 50) then
            equip(sets.misc.AllJobs['Level 30']['Melee'])
        elseif (lvl < 75) then
            equip(sets.misc.AllJobs['Level 50']['Melee'])
        elseif (lvl < 90) then
            equip(sets.misc.AllJobs['Level 75']['Melee'])
        end
    end
    customInfoCheckAftercast(spell.name, spell.tp_cost, spell.mp_cost)
end

function status_change(new, old)
    local lvl = player.main_job_level

    if player.status == "Engaged" then
        if (lvl < 30) then
            equip(sets.misc.AllJobs['Lv1'])
        elseif (lvl < 50) then
            equip(sets.misc.AllJobs['Level 30']['Melee'])
        elseif (lvl < 75) then
            equip(sets.misc.AllJobs['Level 50']['Melee'])
        elseif (lvl < 90) then
            equip(sets.misc.AllJobs['Level 75']['Melee'])
        end
    else
        equip(sets.aftercast[player.status])
	end
end

function buff_change(name, gain)
end

function area_change(new,old)
end

function self_command(command)
	common_self_command(command)
end
