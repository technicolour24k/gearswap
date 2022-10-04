include("organizer-lib")
include("includes/common-functions")
include("includes/config")

showInfo = false
TPStyle = "Sword"
local mjob = player.main_job
wsList = S{"Sword"}
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')

	init_gear_sets(mjob)
	sets.BLU = {}	
	sets.precast.JobAbility = {}
	sets.precast.JobAbility['Azure Lore'] = {}
	sets.precast.JobAbility['Burst Affinity'] = {}
	sets.precast.JobAbility['Chain Affinity'] = {}
	sets.precast.JobAbility['Convergence'] = {}
	sets.precast.JobAbility['Diffusion'] = {}
	sets.precast.JobAbility['Efflux'] = {}
	sets.precast.JobAbility['Unbridled Learning'] = {}
	sets.precast.JobAbility['Unbridled Wisdom'] = {}
	
	sets.precast.WeaponSkills = {}
	sets.precast.WeaponSkills.default = {}
	--FTP Replicating WS
	sets.precast.WeaponSkills['Requiescat'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Chant du Cygne'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Swift Blade'] = set_combine(sets.WeaponSkills['Fotia'], {})
	sets.precast.WeaponSkills['Vorpal Blade'] = set_combine(sets.WeaponSkills['Fotia'], {})
	-- MAB modded WS
	sets.precast.WeaponSkills['Sanguine Blade'] = set_combine( {})
	sets.precast.WeaponSkills['Uriel Blade'] = set_combine(sets.misc.AllJobs.MAB, {})
	-- Standard mods
	sets.precast.WeaponSkills['Savage Blade'] = set_combine(sets.WeaponSkills['AllJobsWS'],{ --50% STR, 50% MND - Equal footing for both

	})
	sets.precast.WeaponSkills['Knights of Round'] = {}
	
	sets.BLU.midcast = {}
	sets.BLU.midcast['Blue Magic'] = {}
    sets.BLU.midcast['Blue Magic']['Physical'] = set_combine(sets.BLU.midcast['Blue Magic'],{})
	sets.BLU.midcast['Blue Magic']['Magical'] = set_combine(sets.BLU.midcast['Blue Magic'],{})

	sets.aftercast.Resting = {}

	sets.aftercast.Engaged = set_combine(sets.misc.AllJobs['Level 75']['Melee'],{})
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged, {
		right_ring={ name="Hermit's Ring", augments={'"Regen"+20','"Refresh"+20','Pet: "Regen"+25','Pet: "Regen"+25',}},
	})
    
	send_command('gs equip sets.aftercast['..player.status..']')
	send_command("[F12] Bound to status removal")
end

function pretarget(spell)
	confirmTarget(spell.skill,spell.target.type)
end

function precast(spell)
	if ((config.showSpellInfo == true) or (showInfo == true)) then
		infoLog("Action: "..spell.english.." | Action Type: "..spell.action_type.."/"..spell.skill.." | MP Cost: "..spell.mp_cost.." | TP Cost: "..spell.tp_cost)
	end


	if sets.precast.JobAbility[spell.english] then
		equip(sets.precast.JobAbility[spell.english])
	end

	if sets.precast.WeaponSkills[spell.english] then
		equip(sets.precast.WeaponSkills[spell.english])
	else
		if ((spell.action_type == "Ability" ) and (wsList:contains(spell.skill))) then
			equip(sets.precast.WeaponSkills.default)
		end
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

	if sets.BLU.midcast[spell.english] then
		equip(sets.BLU.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.BLU.midcast.Cure)
	end

	if sets.BLU.midcast[spell.skill] then
		equip(sets.BLU.midcast[spell.skill])
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
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
end

function status_change(new,old)
	equip(set_combine(sets.aftercast[player.status], sets.weapons[mjob][TPStyle]))
end

function self_command(command)
	
end
