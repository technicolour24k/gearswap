include('includes/config')
include('includes/player-stats')

--initialise variables to inherit from master config
local showFCInfo = config.showFastCastInfo
local showSpellInfo = config.showSpellInfo
local showCancelInfo = config.showCancelInfo


function weathercheck(spell_element,set)
    if not set then return end
    if spell_element == world.weather_element or spell_element == world.day_element then
		send_command('@input /echo >> Weather or Day element matches spell element <<')
        equip(set,sets.Obis[spell_element]) --Equip standard obi, force fallback below
        equip(set,sets.Obis.AIO) --Force fallback onto Hachirin-no-Obi, just in case individual obis no longer exist
    else
        equip(set)
    end
    if set[spell_element] then equip(set[spell_element]) end
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
	add_to_chat(8, "Switching Macros.. Book: "..book.."/Page: "..page)
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
	local remedyListLength = table.getn(remedy_list)
	local remedyOintmentListLength = table.getn(remedyOintment_list)
	local panaceaListLength = table.getn(panacea_list)
	local holyWaterListLength = table.getn(holyWater_list)
	local remedyCount = 0
	local remedyOintmentCount = 0
	local panaceaCount = 0
	local holyWaterCount = 0
	local hallowedWaterCount = 0

	add_to_chat(8, "Clear Status function called")
	
	-- Fail safe in case this accidentally triggers. Should be checked by the calling LUA. 
	if (config.oneClickRemedies) then
		local invTable = windower.ffxi.get_bag_info(0) --Grab the contents of my bag
		local invItemCount = windower.ffxi.get_items(0) --Grab the number of items in bag
		n = 0
		while (n < (invTable.max +1)) do
			local itemInfo = windower.ffxi.get_items(0, n)
			local itemCount = itemInfo.count
			count = 1
			while (count <= 5) do  --Cycle through items and count up Remedies, Ointments, Panacea, and Holy/Hallowed Water
				if (itemInfo.id == 4155) then
					remedyCount = itemInfo.count
				elseif (itemInfo.id == 5356) then
					remedyOintmentCount = itemInfo.count
				elseif (itemInfo.id == 4149) then
					panaceaCount = itemInfo.count
				elseif (itemInfo.id == 4154) then
					holyWaterCount = itemInfo.count
				elseif (itemInfo.id == 5306) then
					hallowedWaterCount = itemInfo.count
				end
				count = count+1
			end
			n = n+1
		end

		for i=1, holyWaterListLength do
			if (buffactive[holyWater_list[i]]) then
				add_to_chat(38, holyWater_list[i].." found in buffactive")
				send_command('input /item "Hallowed Water" <me>')
				send_command('input /item "Holy Water" <me>')
				add_to_chat(10, "Holy Waters remaining: " ..holyWaterCount)
				add_to_chat(10, "Hallowed Waters remaining: " ..hallowedWaterCount)
				break
			end
		end
		
		for i=1, remedyListLength do
			if (buffactive[remedy_list[i]]) then
				add_to_chat(38, remedy_list[i].." found in buffactive")
				send_command('input /item "Remedy" <me>')
				send_command('input /item "Remedy Ointment" <me>')
				add_to_chat(10, "Remedy remaining: " ..remedyCount)
				add_to_chat(10, "Remedy Ointment remaining: " ..remedyOintmentCount)
				break
			end
		end
		
		for i=1, remedyOintmentListLength do
			if (buffactive[remedyOintment_list[i]]) then
				add_to_chat(38, remedyOintment_list[i].." found in buffactive")
				send_command('input /item "Remedy Ointment" <me>')
				add_to_chat(10, "Remedy Ointment remaining: " ..remedyOintmentCount)
				break
			end
		end
		
		for i=1, panaceaListLength do
			if (buffactive[panacea_list[i]]) then
				add_to_chat(38, panacea_list[i].." found in buffactive")
				send_command('input /item "Panacea" <me>')
				add_to_chat(10, "Panacea remaining: " ..panaceaCount)
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