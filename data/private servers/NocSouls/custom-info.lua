include("includes/common-functions")
include("includes/player-stats")

function customInfoCheckPrecast(spell, tpCost, mpCost)
    -- weaponSkillCheck(spell, tpCost, mpCost)
    -- moonshadeCheck(player.equipment.left_ear, player.equipment.right_ear)
end

function customInfoCheckMidcast(spell, tpCost, mpCost)
    if ((spellContains(spell,'Cure')) or (spellContains(spell,'Cura'))) then
        echoInfo('Cure formula updated: MND + VIT/2 + Healing Skill - Rounded down at each step [e.g. '..playerStats.MND['Total']..' MND + '..playerStats.VIT['Total']..'/2 VIT = '..(playerStats.VIT['Total']/2)..' + Healing Magic skill]')
        if ((spellContains(spell, "Cura II")) or (spell == "Cura")) then
            echoInfo("Cura line spells will now wake players up when slept", 0.5)
            echoInfo("Cura line spells will now properly return MP to players with the “Cure To MP %” item modifier.", 1.0)
        end
    end

    if (spell=="Phalanx") then
        echoInfo("Extra 5% block rate with shield")
    end

    local FrazzleDistract = S{"Distract","Distract II","Frazzle","Frazzle II"}
    if (FrazzleDistract:contains(spell)) then
        local enfMag = skills['enfeebling_magic']
        local enf4 = skills['enfeebling_magic']*4
        local drizzleResult = math.floor(enf4/15)

        echoInfo('Formula updated to (enfeebling magic * 4) / 15')
        echoInfo('Result - Enfeebling Magic: ' ..skills['enfeebling_magic']..' * 4 = '..enf4..' /15 =' ..drizzleResult, 0.5)
        if ((spell=="Distract") or (spell=="Frazzle")) then
            echoInfo('Cap: '..drizzleResult..'/75',1.0)
        else
            echoInfo('Cap: '..drizzleResult..'/150',1.0)
        end
    end

    -- moonshadeCheck(player.equipment.left_ear, player.equipment.right_ear)
end


function customInfoCheckAftercast(spell, tpCost, mpCost)

end


-- function moonshadeCheck(lear,rear)
--     if ((lear == "Moonshade Earring") or (rear == "Moonshade Earring")) then
--         if ((player.main_job_id == 1) or (player.main_job_id == 2)) then
--             bonus = "Smite +3%"
--         elseif (player.main_job_id == 3) then
--             bonus = "2% Cure amount to MP"
--         elseif (player.main_job_id == 4) then
--             bonus = "3% to day nuke"
--         elseif (player.main_job_id == 5) then
--             bonus = "3% Enfeebling Magic Potency"
--         elseif (player.main_job_id == 6) then
--             bonus = "3% Critical hit damage"
--         elseif (player.main_job_id == 7) then
--             bonus = "-3% Damage Taken"
--         elseif (player.main_job_id == 8) then
--             bonus = "3% Stalwart Soul potency"
--         elseif (player.main_job_id == 9) then
--             bonus = "Fencer: TP Bonus +50, Crit Hit Rate +2%"
--         elseif (player.main_job_id == 10) then
--             bonus = "Song Duration +10% (~12 seconds)"
--         elseif (player.main_job_id == 11) then
--             bonus = "Double Shot Rate +3%"
--         elseif (player.main_job_id == 12) then
--             bonus = "Skillchain Damage +4%"
--         elseif (player.main_job_id == 13) then
--             bonus = "Ninjutsu damage +5%"
--         elseif (player.main_job_id == 14) then
--             bonus = "Conserve TP +3%"
--         elseif (player.main_job_id == 15) then
--             bonus = "Blood Pact Damage +5%"
--         elseif (player.main_job_id == 16) then
--             bonus = "300TP Bonus"
--         elseif (player.main_job_id == 17) then
--             bonus = "Quick Draw Damage +5%"
--         elseif (player.main_job_id == 18) then
--             bonus = "Martial Arts +20"
--         elseif (player.main_job_id == 19) then
--             bonus = "Skillchain Damage +3%"
--         elseif (player.main_job_id == 20) then
--             bonus = "Iridescence +1"
--         end
--         echoInfo('Moonshade Earring bonus: '..bonus..'.')
--     end
-- end

-- function weaponSkillCheck(spell, tpCost, mpCost)
--     if (spell == "Chant du Cygne") then
--         if (tpCost < 2000) then
--             echoInfo('[Almace i119 III] Critical hit rate increased to 20%')
--         elseif (tpCost < 3000) then
--             echoInfo('[Almace i119 III] Critical hit rate increased to 35%')
--         else            
--             echoInfo('[Almace i119 III] Critical hit rate increased to 65%')
--         end
--     elseif (spell == "Uriel Blade") then
--         echoInfo('AOE Magic WS, Flash, and Enmity+ to all affected enemies')
--     elseif (spell == "Glory Blade") then
--         echoInfo('AOE Physical WS, with Stun effect')
--     elseif (spell == "Victory Smite") then
--         echoInfo('[Verethagna i119 III] 40% VIT modifier added (80% STR/40% VIT)')
--     elseif (spell == "Rudra's Storm") then
--         echoInfo('[Twashtar i119 III] 500HP/Tick Choke effect')
--     elseif (spell == "Torcleaver") then
--         if (tpCost < 2000) then
--             echoInfo('[Caladbolg i119 III] fTP increased to 6.75 (~40% increase)')
--         elseif (tpCost < 3000) then
--             echoInfo('[Caladbolg i119 III] fTP increased to 9.50 (~30% increase)')
--         else            
--             echoInfo('[Caladbolg i119 III] fTP increased to 12.00 (20% increase)')
--         end
--     elseif (spell == "Cloudsplitter") then
--         echoInfo('[Farsha i119 III] Modifiers increased - 80% STR/80% MND')
--     elseif (spell == "Dagan") then
--         echoInfo('[Gambanteinn i119 III] HP Restoration doubled')
--         echoInfo('[Gambanteinn i119 III] Removes up to 3 negative effects (includes Doom)', 0.5)
--     elseif (spell == "Wildfire") then
--         echoInfo('[Armageddon i119 III] 500HP/Tick Burn effect')
--         echoInfo('[Armageddon i119 III] fTP increased to 4.75 / 5.00 / 5.25', 0.5)
--     elseif (spell == "Jishnu's Radiance") then
--         echoInfo('[Gandiva i119 III] Gained 10% STR modifier (80% DEX/10% STR)')
--         echoInfo('[Gandiva i119 III] fTP increased to 1.75 / 2.25 / 2.75', 0.5)
        
--         if (tpCost < 2000) then
--             echoInfo('[Gandiva i119 III] Critical hit chance increased to 25%', 1.0)
--         elseif (tpCost < 3000) then
--             echoInfo('[Gandiva i119 III] Critical hit chance increased to 35%', 1.0)
--         else            
--             echoInfo('[Gandiva i119 III] Critical hit chance increased to 50%', 1.0)
--         end
--     elseif (spell == "Ukko's Fury") then
--         echoInfo('[Ukonvasra i119 III] Increased - 80% STR modifier (80% STR/45% VIT)')
--         echoInfo('[Ukonvasra i119 III] fTP increased to 3.50 / 4.50 / 5.50', 0.5)

--         if (tpCost < 2000) then
--             echoInfo('[Ukonvasra i119 III] Critical hit chance increased to 25%', 1.0)
--         elseif (tpCost < 3000) then
--             echoInfo('[Ukonvasra i119 III] Critical hit chance increased to 45%', 1.0)
--         else            
--             echoInfo('[Ukonvasra i119 III] Critical hit chance increased to 65%', 1.0)
--         end
--     elseif (spell == "Quietus") then
--         echoInfo('[Redemption i119 III] fTP increased to 3.50 / 4.50 / 5.50')

--         if (tpCost < 2000) then
--             echoInfo('[Redemption i119 III] Ignored defence increased to 25%', 0.5)
--         elseif (tpCost < 3000) then
--             echoInfo('[Redemption i119 III] Ignored defence increased to 45%', 0.5)
--         else            
--             echoInfo('[Redemption i119 III] Ignored defence increased to 75%', 0.5)
--         end
--     elseif (spell == "Camlann's Torment") then
--         echoInfo('[Rhongomiant i119 III] fTP increased to 3.50 / 4.50 / 5.50')

--         if (tpCost < 2000) then
--             echoInfo('[Rhongomiant i119 III] Ignored defence increased to 25%', 0.5)
--         elseif (tpCost < 3000) then
--             echoInfo('[Rhongomiant i119 III] Ignored defence increased to 45%', 0.5)
--         else            
--             echoInfo('[Rhongomiant i119 III] Ignored defence increased to 75%', 0.5)
--         end
--     elseif (spell == "Blade: Hi") then
--         echoInfo('[Kannagi i119 III] Added 70% STR modifier (80% AGI/70% STR)')

--         if (tpCost < 2000) then
--             echoInfo('[Kannagi i119 III] Critical hit chance increased to 25%', 0.5)
--         elseif (tpCost < 3000) then
--             echoInfo('[Kannagi i119 III] Critical hit chance increased to 45%', 0.5)
--         else            
--             echoInfo('[Kannagi i119 III] Critical hit chance increased to 65%', 0.5)
--         end
--     elseif (spell == "Tachi: Enpi") then
--         echoInfo('Free blink shadow')
--     elseif (spell == "Tachi: Fudo") then
--         echoInfo('[Masamune i119 III] Added 25% DEX modifier (80% STR/25% DEX)')

--         if (tpCost < 2000) then
--             echoInfo('[Masamune i119 III] fTP increased to 5.75 (~55% increase)', 0.5)
--         elseif (tpCost < 3000) then
--             echoInfo('[Masamune i119 III] fTP increased to 8.75 (~55% increase)', 0.5)
--         else            
--             echoInfo('[Masamune i119 III] fTP increased to 12.00 (50% increase)', 0.5)
--         end
--     elseif (spell== "Omniscience") then
--         echoInfo('Monster MAB reduction now -50 instead of -10')
--     elseif (spell == "Tartarus Torpor") then 
--         echoInfo('AOE Magic WS, with Plague & Sleep')
--     elseif (spell == "Garland of Bliss") then
--         echoInfo('Heals SMN Avatar for 5%')
--     elseif (spell == "Myrkr") then
--         echoInfo('[Hvergelmir i119 III] Removes all negative status effects, including Doom')
--     end
-- end