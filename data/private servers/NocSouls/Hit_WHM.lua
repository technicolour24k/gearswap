include("organizer-lib")
include("includes/common-functions")
include("includes/config")

skillup = 0
showInfo = false
local mjob = player.main_job
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo
local FastCast = 80

function get_sets()
	include('private servers/'..server..'/common-gearsets')
	include('private servers/'..server..'/custom-info')

	init_gear_sets(mjob)

	sets.WHM = {}
	sets.WHM.midcast ={}
	sets.WHM.midcast.Cure = {
		main = "Templar Mace", --Cure 10%
		sub = "Sors Shield", --Cure 3%
		ammo = "Quartz Tathlum +1",
		head = "Theophany Cap +2", --Cure +11% [11% + 0%]
		neck = "Ajari Bead Necklace",
		left_ear = "Roundel Earring", --Cure +5% [16% + 0%]
		body = "Theophany Briault +2", --Cure II +3% [16% + 3%]
		hands = "Theophany Mitts +2", --Cure II +2% [16% + 5%]
		left_ring = "Ephedra Ring",
		right_ring = "Stikini Ring +1",
		back = "Ixion Cape",
		waist = "Witch Sash",
		legs = "Orison Pantaloons +2", --5% Cure amount -> MP
		feet = "Theophany Duckbills +2" 
	}
	sets.WHM.midcast.Cursna = {
		main = "Yagrush",
		right_ring = "Ephedra Ring",
		left_ring = "Ephedra Ring"
	}
	sets.WHM.midcast.StatFix = {
		main = "Yagrush"
	}
	sets.WHM.midcast['Enhancing Magic'] = {
		legs = "Piety Pantaloons +1"
	}
	sets.WHM.midcast.Barspells = set_combine(sets.WHM.midcast['Enhancing Magic'], { })
	sets.WHM.midcast.Stoneskin = set_combine(sets.WHM.midcast['Enhancing Magic'], { })
	sets.WHM.midcast.Aquaveil = set_combine(sets.WHM.midcast['Enhancing Magic'], { })
	sets.WHM.midcast.Regen = set_combine(sets.WHM.midcast['Enhancing Magic'], { 
		body = "Piety Briault +1",
		hands = "Orison Mitts +2",
		legs = "Theophany Pantaloons +2"
	})
	sets.WHM.midcast['Elemental Magic'] = {
		main = "Blurred Staff",
		sub = "Elementa Grip",
		neck = "Lemegeton Medallion",
		body = "Pharmakeia Robe",
		hands = "Weatherspoon Cuffs",	
		right_ring = "Stikini Ring +1",
		back = "Hecate's Cape",
		waist = "Searing Sash",
		legs = "Wicca Subligar",
		feet = "Weatherspoon Souliers"		
	}
	
	sets.aftercast = {}
	sets.aftercast.Idle = set_combine(sets.WHM.midcast.Cure, {
		--main = "Earth Staff",
		body = "Theophany Briault +2",
		feet = "Herald's Gaiters",
		right_ring = "Stikini Ring +1"
	})
	sets.aftercast.Engaged = {}

end

	CureSpells = S{	'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Cure V', 'Cure VI',
					'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Curaga V',
					'Cura', 'Cura II', 'Cura III'}

	StatSpells = S{	'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Erase'}
	
	BarSpells = S{	'Barfira', 'Barblizzara', 'Barstonra', 'Baraera', 'Barthundra', 'Barwatera'}
	
	RegenSpells = S{'Regen', 'Regen II', 'Regen III', 'Regen IV'}
	
	

function precast(spell)
	if spell.action_type == 'Magic' then
        equip(sets.common.precast.FastCast.Default)
    end
	
	
end

function midcast(spell)  
	cancelBuff(spell.english, spell.cast_time, FastCast)

	if sets.WHM.midcast[spell.english] then
		equip(sets.WHM.midcast[spell.english])
	elseif sets.common.midcast[spell.english] then
		equip(sets.common.midcast[spell.english])
	elseif string.find(spell.english,'Cure') or string.find(spell.english,'Cura') then 
        equip(sets.WHM.midcast.Cure)
	end

	if sets.WHM.midcast[spell.skill] then
		equip(sets.WHM.midcast[spell.skill])
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
	if player.status == "Engaged" then
		equip(sets.aftercast.Engaged)
	else
		equip(sets.aftercast.Idle)
	end
end

function status_change(new,old)

end

function buff_change(name,gol,tab)

end

function self_command(command)
	common_self_command(command)

	if command:lower() == "cmd" then

	end
end