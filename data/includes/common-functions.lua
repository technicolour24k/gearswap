include('includes/config')
include('includes/player-stats')
res = require('resources')


--initialise variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo

--@param spell_element: Element of the spell you're using
function weathercheck(spell_element)
    if spell_element == world.weather_element or spell_element == world.day_element then
		send_command('@input /echo >> Weather or Day element matches spell element <<')
        equip(sets.Obis[spell_element]) --Equip standard obi, force fallback below
        equip(sets.Obis.AIO) --Force fallback onto Hachirin-no-Obi, just in case individual obis no longer exist
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
	
	--Last responsible moment to cancel is 75% of your total FastCastMultiplier - 80% Fast Cast means 20% total cast time (10s => 2s). Take 75% of this final amount to cancel out, stopping any rogue late cancels
	FastCastMultiplier = FastCastMultiplier*0.75
	
	if (autoCancelList:contains(spell)) then
		add_to_chat(8, spell.." found in auto-cancel list.")

		if (showFCInfo) then
			add_to_chat(8, "Base casting time: " ..casttime)
			add_to_chat(8, "Fast Cast Amount: " ..FastCastAmount.."%. Fast Cast Multiplier is: " ..FastCastMultiplier..". Cancelling spells at "..(FastCastMultiplier*100).."%.")
		end
		
		if (not(skill == "JobAbility") and not(skill == "Jig")) then
			delay = (casttime * FastCastMultiplier)
		else
			delay = 0
		end
		
		if (showCancelInfo) then
			add_to_chat(8, "Delay to cancel buff: " ..delay)
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

function announceSpell(spell,target,chatmode)
	local announcementList = S{"Accomplice","Collaborator","Stun"}
	if (announcementList:contains(spell)) then
		send_command('input /'..chatmode..' '..spell..' => '..target)
	end
end

windower.register_event('gain buff', function(id)
	-- Status ID list: https://github.com/Windower/Resources/blob/master/resources_data/buffs.lua
   clearStatuses()

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