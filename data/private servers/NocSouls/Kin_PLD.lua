include('organizer-lib')
include('includes/common-functions')
include('private servers/'..server..'/common-gearsets')
include('includes/config')

--initialise local variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

TPStyle = {"Default", "Attack", "Accuracy", "Turtle"}
TPStyleIndex = 1
autoLightTracker = 0
autoSCPushed = false

function get_sets()
	local mjob = player.main_job
	init_gear_sets(mjob)

    sets.TH = {
	}
    
	sets.JobAbility['Invincible'] = {}
	sets.JobAbility['Sentinel'] = { feet="Valor Leggings" }
	sets.JobAbility['Shield Bash'] = { hands = {name="Valor Gauntlets +1" } }
	sets.JobAbility['Cover']= {head="Gallant Coronet"}
	sets.JobAbility['Provoke'] = set_combine(sets.Enmity,{})
	sets.JobAbility['Rampart'] = { head="Valor Coronet"}
	
	sets.WeaponSkills['Requiescat'] = {}
	sets.WeaponSkills['Chant du Cygne'] = {}
	sets.WeaponSkills['Sanguine Blade'] = {
		head="Rev. Coronet +2",
		body="Rev. Surcoat +2",
		hands="Rev. Gauntlets +2",
		legs="Rev. Breeches +2",
		feet="Rev. Leggings +2",
		neck="Stoicheion Medal",
		waist="Dynamic Belt +1",
		left_ear="Moldavite Earring",
		right_ear="Sortiarius Earring",
		left_ring="Genius Ring",
		right_ring="Genius Ring",
		back="Metallon Mantle",}
	sets.WeaponSkills['Uriel Blade'] = {}
	sets.WeaponSkills['Atonement'] = {}
	sets.WeaponSkills['Knights of Round']	= {}

    sets.precast.Cure = set_combine(sets.precast.FastCast.Default,{ left_ear="Oneiros Earring" }  )
	sets.Enmity = {}
    
    sets.midcast.Cure = {	
		head="Valor Coronet", 
		left_ear="Oneiros Earring",
	}

    sets.aftercast.Engaged = {}
	sets.aftercast.Engaged.Default = set_combine(sets.weapons[mjob]['Sword'], {
		range="Killer Shortbow",
		head="Rev. Coronet +2",
		body="Rev. Surcoat +2",
		hands="Rev. Gauntlets +2",
		legs="Rev. Breeches +2",
		feet="Chev. Sabatons",
		neck="Ziel Charm",
		left_ear="Mache Earring +1",
		right_ear="Mache Earring +1",
		waist="Dynamic Belt +1",
		left_ring="Mars's Ring",
		right_ring="Defending Ring",
		back="Metallon Mantle"
	})
	sets.aftercast.Engaged.Attack = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Accuracy = set_combine(sets.aftercast.Engaged.Default, {})
	sets.aftercast.Engaged.Turtle = set_combine(sets.aftercast.Engaged.Default, {right_ear="Buckler Earring",})
    
	sets.aftercast.Idle = set_combine(sets.aftercast.Engaged.Default, {legs="Crimson Cuisses"})
    sets.aftercast.Resting = set_combine(sets.aftercast.Engaged.Default, {main="Almace"})

    sets.Obis = {}
    sets.Obis.Fire = {}
    sets.Obis.Earth = {}
    sets.Obis.Water = {}
    sets.Obis.Wind = {}
    sets.Obis.Ice = {}
    sets.Obis.Lightning = {}
    sets.Obis.Light = {}
    sets.Obis.Dark = {}
	
	enspell_list = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Enlight"}

   	send_command('gs enable all') 
	switchMacroSet(7,1)
	send_command('input /echo [F9] Bound to Default TP Gear;bind F9 gs c default')
	send_command('input /echo [F10] Bound to Set Attack heavy TP Gear;bind F10 gs c attack')
	send_command('input /echo [F11] Bound to Set Accuracy heavy TP Gear;bind F11 gs c accuracy')
	send_command('input /echo [F12] Bound to Set Defense heavy TP Gear;bind F12 gs c turtle')
	
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
	elseif command:lower() == "attack" then
		TPStyleIndex = 2		
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "accuracy" then
		TPStyleIndex = 3
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	elseif command:lower() == "turtle" then
		TPStyleIndex = 4
		add_to_chat(8, 'TP Style is now: '.. TPStyle[TPStyleIndex] .. '!')
		equip(sets.aftercast.Engaged[TPStyle[TPStyleIndex]])
	end
	
	if command:lower() == "autolight" then
		if ((player.tp > 999) and (autoSCPushed == false)) then
			autoSCPushed = true
			if autoLightTracker == 0 then
					send_command('input /ws "Death Blossom" <t>')
					autoLightTracker = 1
					autoSCPushed = false
			elseif autoLightTracker == 1 then
					send_command('input /ws "Knights of Round" <t>')
					autoLightTracker = 2
					autoSCPushed = false
			elseif autoLightTracker == 2 then
					send_command('input /ws "Chant du Cygne" <t>')
					send_command('wait 5;input /ma "Holy II" <t>')
					autoLightTracker = 0
					autoSCPushed = false
			end
		end
	end

	equipGearByState()

end
