include('includes/config')
include('includes/mob-immunities')
include('includes/player-stats')
res = require('resources')


--initialise variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo

--@param spell_element: Element of the spell you're using
--@param spell_skill: Skill of the spell you're using. Recommended spell.skill
function weathercheck(spell_element, spell_skill)
	if not (spell_skill) then spell_skill = null end
	if ((spell_skill=="Elemental Magic") or (spell_skill=="Healing Magic") or (spell_skill=="Enfeebling Magic") or spell_skill=="Blue Magic" or (spell_skill==null)) then
		if spell_element == world.weather_element or spell_element == world.day_element then
			infoLog('>> Weather or Day element matches spell element <<')
			equip(sets.Obis[spell_element]) --Equip standard obi, force fallback below
			equip(sets.Obis.AIO) --Force fallback onto Hachirin-no-Obi, just in case individual obis no longer exist
		end
	end
end


function checkForTown()
	if(string.find(world.zone,"San d'Oria")) then
		equip(sets.misc.Sandy)
	elseif(string.find(world.zone,"Windurst")) then
		equip(sets.misc.Windy)
	elseif(string.find(world.zone,"Bastok") or (string.find(world.zone,"Metalworks"))) then
		equip(sets.misc.Bastok)
	elseif(string.find(world.zone,"Garden")) then
		equip(sets.misc.Gardening)
	end
end

--- CancelBuff documentation
-- @param spell: The name of the spell you're using. Recommendation: spell.english
-- @param casttime: The base cast time of the spell you're using. Recommendation: spell.cast_time
-- @param FC: The amount of FastCast you will have
-- @param buff: The buff name you're targeting (e.g. "Sneak")
-- @param skill: The type of skill you're using, e.g. JobAbility, EnhancingMagic, etc.
function cancelBuff(spell, casttime, FC, buff, skill) --Requires cancel plugin
	--Setup list of buffs to be autocancelled
	local autoCancelList = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Stoneskin", "Blaze Spikes","Ice Spikes", "Shock Spikes", "Sneak", "Spectral Jig"}
	
	--Setup amount of Fast Cast available
	local FastCastAmount = FC
	
	-- Multiply out Fast Cast - 80% Fast Cast will result in a 0.2 multiplier (20%)
	-- Setting FastCastAmount properly lets FastCastMultiplier to determine how quickly we need to cancel buffs
	local FastCastMultiplier = ((100 - FastCastAmount)/100)
	if (showFCInfo) then infoLog("[FastCastMultiplier] FastCastMultiplier: ((100 - " .. FastCastAmount..") /100 = " .. FastCastMultiplier) end

	--Last responsible moment to cancel is 75% of your total FastCastMultiplier - 80% Fast Cast means 20% total cast time (10s => 2s). Take 75% of this final amount to cancel out, stopping any rogue late cancels
	FastCastMultiplier = FastCastMultiplier*0.75
	if (showFCInfo) then infoLog("[FastCastMultiplier] Cancel After: ((FastCastMultiplier * 0.75 = " .. FastCastMultiplier) end

	if (autoCancelList:contains(spell)) then
		infoLog("[AutoCancel List] "..spell.." found in auto-cancel list.")

		if (showFCInfo) then
			infoLog("[FCInfo] Base casting time: " ..casttime)
			infoLog("[FCInfo] Fast Cast Amount: " ..FastCastAmount.."%. Fast Cast Multiplier is: " ..FastCastMultiplier..". Cancelling spells at "..(FastCastMultiplier*100).."%.")
		end
		
		if (not(skill == "JobAbility") and not(skill == "Jig")) then
			delay = (casttime * FastCastMultiplier)
		else
			delay = 0
		end
		
		if (showCancelInfo) then
			infoLog("[CancelInfo] Delay to cancel buff: " ..delay)
		end
		
		if buff == nil then --if we haven't passed a buff down, cancel the spell
			send_command('@wait '..delay..'; cancel '..spell)
			if (showCancelInfo) then
				add_to_chat(10, "Cancelling "..spell.." in "..delay.."s...")
			end
		else
			send_command('@wait '..delay..'; cancel '..buff)
			if (showCancelInfo) then
				add_to_chat(10, "Cancelling "..buff.." in "..delay.."s...")
			end
		end
	end
end

-- Just a neater macro change option
function switchMacroSet(book, page)
	infoLog("Switching Macros.. Book: "..book.."/Page: "..page)
    send_command('input /macro book '..book..';wait .1;input /macro set '..page)
end

-- spellContains documentation
-- @param spell: The name of the spell you're comparing against. Recommendation: spell.english
-- @param contains: The string you're looking for
function spellContains(spell, contains)
	if (string.find(spell,contains)) then
		return true
	else
		return false
	end
end

 function clearStatuses()	
 	local remedyListLength = #remedy_list
 	local remedyOintmentListLength = #remedyOintment_list
 	local panaceaListLength = #panacea_list
 	local holyWaterListLength = #holyWater_list		
		-- Fail safe in case this accidentally triggers. Should be checked by the calling LUA. 
		if (config.oneClickRemedies) then
		for i=1, holyWaterListLength do
		   if (buffactive[holyWater_list[i]]) then
			   send_command('input /item "Hallowed Water" <me>')
			   send_command('input /item "Holy Water" <me>')
			   break
		   end
	   end
	   for i=1, remedyListLength do
			if (buffactive[remedy_list[i]]) then
				send_command('input /item "Remedy" <me>')
				break
			end
		end	
		for i=1, remedyOintmentListLength do
			if (buffactive[remedyOintment_list[i]]) then
				send_command('input /item "Rmdy. Ointment" <me>')
				break
			end
		end	
		for i=1, panaceaListLength do
			if (buffactive[panacea_list[i]]) then
				send_command('input /item "Panacea" <me>')
				break
			end
		end
 	end
 end

 -- echoInfo documentation
 -- @param info: The info you want to output
 -- @param delay: Any particular delay in putting this info out.
function echoInfo(info,delay)
	if (delay) then
		send_command('@wait '..delay..'; input /echo '..info)
	else
		send_command('input /echo '..info)
	end
end

function confirmTarget(skill,targetType)
	if (((skill == "Healing Magic") or (skill == "Enhancing Magic")) and (targetType == "MONSTER")) then
		change_target("<me>")
		add_to_chat(11, skill.." against a "..targetType.."! Changing targets to self")
	end
end

function infoLog (log)
	add_to_chat(12, log)
end

function errorLog(log)
	add_to_chat(13, log)
end

function debugLog(log)
	add_to_chat(11, log)
end

-- announceSpell documentation
-- @param spell: The name of the spell you're using. Recommendation: spell.english
-- @param target: The target of the spell you're using. Recommendation: spell.target.name
-- @param chatmode: The chatmode you want to send info through. Recommendation: p
function announceSpell(spell,target,chatmode)
	local announcementList = S{"Accomplice","Collaborator","Stun"}
	if (announcementList:contains(spell)) then
		send_command('input /'..chatmode..' '..spell..' => '..target)
	end
end

windower.register_event('gain buff', function(id)
	-- Status ID list: https://github.com/Windower/Resources/blob/master/resources_data/buffs.lua
--    clearStatuses()

   if (id == 28) then --Terror
	infoLog("Hit with Terror - Equipping common DTCombo set")
	equip(sets.misc.AllJobs['DTCombo'])
   end

end)

function common_self_command(cmd)
	if cmd:lower() == "status-check" then
		if (config.oneClickRemedies) then
			clearStatuses()
		end
	end
	if cmd:lower() == "mdtdown" then
		equip(sets.misc.AllJobs["MDTDown"])
		infoLog("Equipping MDT Gear")
	end
	if cmd:lower() == "pdtdown" then
		equip(sets.misc.AllJobs["PDTDown"])
		infoLog("Equipping PDT Gear")
	end
end

function enemyImmunityCheck (mob,spell)
	if (enemy[mob]) then
		for key,value in pairs(enemy[mob]) do 
			if (spellContains(spell,value)) then
				infoLog(mob .. " is immune to " .. value .. ". Cancelling spell")
				cancel_spell()
			end
		end
	end
end

function commonPrecastRules (sets, spell, skill, type)

	if sets.JobAbility[spell] then
		equip(sets.JobAbility[spell])
	end

	if sets.WeaponSkills[spell] then
		equip(sets.WeaponSkills[spell])
	end

	if sets.precast[spell] then
		equip(sets.precast[spell])
	end

	if type == "Magic" then
		equip(sets.common.precast.FastCast.Default)
	end
	
	if spellContains(spell,' Arts') then
        activeArts = spell
    end

	if ((spellContains(spell,"Step")) and (buffactive['Presto']==false) and (player.main_job=="DNC")) then
		-- if((buffactive['Finishing Move*']==0) or (buffactive['Finishing Move (2)'] == 1)) then
			local step = spell
			infoLog("Current backup step: "..step)
			cancel_spell()
			send_command('presto;wait 1;'..step)
		else
			infoLog("Skipping Presto")
		end
	-- end

end


function commonMidcastRules (sets,spell,skill,type)
	if sets[mjob].midcast[skill] then
		equip(sets[mjob].midcast[skill])
	elseif sets.common.midcast[skill] then
		equip(sets.common.midcast[skill])
	end

	if sets[mjob].midcast[spell] then
		equip(sets[mjob].midcast[spell])
	elseif sets.common.midcast[spell] then
		equip(sets.common.midcast[spell])
	elseif string.find(spell,'Cure') or string.find(spell,'Cura') then 
        equip(sets[mjob].midcast.Cure)
	end

	if (enspell_list:contains(spell)) then
		equip(sets.common.midcast.Enspell)
	end
	
	if (conserveMP_list:contains(spell)) then
		equip(sets.common.midcast.ConserveMP)
	end

	if ((mjob=="BLU") or (sjob=="BLU")) then
		if (BLU_Buffs:contains(spell)) then
			if (sets[mjob].midcast.BLU_Buffs) then
				equip(sets[mjob].midcast.BLU_Buffs)
			elseif (sets.common.midcast.BLU_Buffs) then
				equip(sets.common.midcast.BLU_Buffs)
			end
		end

		if (BLU_Nukes:contains(spell)) then
			if (sets[mjob].midcast.BLU_Nukes) then
				equip(sets[mjob].midcast.BLU_Nukes)
			elseif (sets.common.midcast.BLU_Nukes) then
				equip(sets.common.midcast.BLU_Nukes)
			end
		end

		if (BLU_Physical:contains(spell)) then
			if (sets[mjob].midcast.BLU_Physical) then
				equip(sets[mjob].midcast.BLU_Physical)
			elseif (sets.common.midcast.BLU_Physical) then
				equip(sets.common.midcast.BLU_Physical)
			end
		end
	end

	if ((mjob=="SCH") or (sjob=="SCH")) then
		if (Helixes:contains(spell) or spellContains(spell, "Dia")) then
			if activeArts == "default" then
				equip(sets[mjob].midcast['Helixes'])
			else
				equip(sets[mjob].midcast['Helixes'][activeArts])
			end
		end
	end
end

function commonAftercastRules (sets,spell,skill,type)

end

function equipPreviousGear(request)
	local main,sub,ranged,ammo,head,neck,lear,rear,body,hands,lring,rring,back,waist,legs,feet
	if (request == "set") then
		-- Assign weapons
		main = player.equipment.main
		sub = player.equipment.sub
		ranged = player.equipment.range
		ammo = player.equipment.ammo
		-- Assign armour
		head = player.equipment.head
		body = player.equipment.body
		hands = player.equipment.hands
		legs = player.equipment.legs
		feet = player.equipment.feet
		-- Assign accessories
		lear = player.equipment.left_ear
		rear = player.equipment.right_ear
		lring = player.equipment.left_ring
		rring = player.equipment.right_ring
		back = player.equipment.back
		waist = player.equipment.waist
		neck = player.equipment.neck
		
		sets.previousSet = {
			main = main,
			sub = sub,
			range = ranged,
			ammo = ammo,
			head = head,
			body = body,
			hands = hands,
			legs = legs,
			feet = feet,
			lear = lear,
			rear = rear,
			lring = lring,
			rring = rring,
			back = back,
			waist = waist,
			neck = neck
		}
	else if(request == "equip") then
		equip(sets.previousSet)
	end
	
end
end