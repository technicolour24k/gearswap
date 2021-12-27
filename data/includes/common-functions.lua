include('includes/config')

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


function equipGearByState()
	if player.status == 'Idle' then
		equip(sets.aftercast.Idle)
	elseif sets.aftercast[player.status][TPStyle[TPStyleIndex]] then
		equip(sets.aftercast[player.status][TPStyle[TPStyleIndex]],sets.aftercast)
	else
		equip(sets.aftercast.Idle,sets.aftercast)
	end
	checkForTown()
end

function checkForTown()
	if(string.find(world.area,"San d'Oria")) then
		equip(sets.misc.Sandy)
	elseif(string.find(world.area,"Windurst")) then
		equip(sets.misc.Windy)
	elseif(string.find(world.area,"Bastok") or (string.find(world.area,"Metalworks"))) then
		equip(sets.misc.Bastok)
	elseif(string.find(world.area,"Garden")) then
		equip(sets.misc.Gardening)
	end
end

function cancelBuff(spell, casttime, FC, buff) --Requires cancel plugin

	--Setup list of buffs to be autocancelled
	local autoCancelList = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Stoneskin", "Blaze Spikes","Ice Spikes", "Shock Spikes"}
	
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
		delay = (casttime * FastCastMultiplier)
		if (showCancelInfo) then
			add_to_chat(8, "Delay to cancel buff: " ..delay)
		end
		
		if buff == nil then
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