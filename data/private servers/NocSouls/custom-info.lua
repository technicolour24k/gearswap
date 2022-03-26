include("includes/common-functions")

function customInfoCheck(spell, tpCost, mpCost)

    if (spell == "Chant du Cygne") then
        if (tpCost < 2000) then
            echoInfo('[Almace i119 III] Critical hit rate increased to 20%')
        elseif (tpCost < 3000) then
            echoInfo('[Almace i119 III] Critical hit rate increased to 35%')
        else            
            echoInfo('[Almace i119 III] Critical hit rate increased to 65%')
        end
    end

    if (spell == "Uriel Blade") then
        echoInfo('AOE Magic WS, Flash, and Enmity+ to all affected enemies')
    end

    if (spell == "Glory Blade") then
        echoInfo('AOE Physical WS, with Stun effect')
    end

    if (spell == "Victory Smite") then
        echoInfo('[Verethagna i119 III] 40% VIT modifier added (80% STR/40% VIT)')
    end

    if (spell == "Rudra's Storm") then
        echoInfo('[Twashtar i119 III] 500HP/Tick Choke effect')
    end

    if (spell == "Torcleaver") then
        if (tpCost < 2000) then
            echoInfo('[Caladbolg i119 III] fTP increased to 6.75 (~40% increase)')
        elseif (tpCost < 3000) then
            echoInfo('[Caladbolg i119 III] fTP increased to 9.50 (~30% increase)')
        else            
            echoInfo('[Caladbolg i119 III] fTP increased to 12.00 (20% increase)')
        end
    end

    if (spell == "Cloudsplitter") then
        echoInfo('[Farsha i119 III] Modifiers increased - 80% STR/80% MND')
    end

    if (spell == "Dagan") then
        echoInfo('[Gambanteinn i119 III] HP Restoration doubled')
        echoInfo('[Gambanteinn i119 III] Removes up to 3 negative effects (includes Doom)', 0.5)
    end

    if (spell == "Wildfire") then
        echoInfo('[Armageddon i119 III] 500HP/Tick Burn effect')
        echoInfo('[Armageddon i119 III] fTP increased to 4.75 / 5.00 / 5.25', 0.5)
    end
    
    if (spell == "Jishnu's Radiance") then
        echoInfo('[Gandiva i119 III] Gained 10% STR modifier (80% DEX/10% STR)')
        echoInfo('[Gandiva i119 III] fTP increased to 1.75 / 2.25 / 2.75', 0.5)

        if (tpCost < 2000) then
            echoInfo('[Gandiva i119 III] Critical hit chance increased to 25%', 1.0)
        elseif (tpCost < 3000) then
            echoInfo('[Gandiva i119 III] Critical hit chance increased to 35%', 1.0)
        else            
            echoInfo('[Gandiva i119 III] Critical hit chance increased to 50%', 1.0)
        end
    end

    if (spell == "Ukko's Fury") then
        echoInfo('[Ukonvasra i119 III] Increased - 80% STR modifier (80% STR/45% VIT)')
        echoInfo('[Ukonvasra i119 III] fTP increased to 3.50 / 4.50 / 5.50', 0.5)

        if (tpCost < 2000) then
            echoInfo('[Ukonvasra i119 III] Critical hit chance increased to 25%', 1.0)
        elseif (tpCost < 3000) then
            echoInfo('[Ukonvasra i119 III] Critical hit chance increased to 45%', 1.0)
        else            
            echoInfo('[Ukonvasra i119 III] Critical hit chance increased to 65%', 1.0)
        end
    end

    if (spell == "Quietus") then
        echoInfo('[Redemption i119 III] fTP increased to 3.50 / 4.50 / 5.50')

        if (tpCost < 2000) then
            echoInfo('[Redemption i119 III] Ignored defence increased to 25%', 0.5)
        elseif (tpCost < 3000) then
            echoInfo('[Redemption i119 III] Ignored defence increased to 45%', 0.5)
        else            
            echoInfo('[Redemption i119 III] Ignored defence increased to 75%', 0.5)
        end
    end

    if (spell == "Camlann's Torment") then
        echoInfo('[Rhongomiant i119 III] fTP increased to 3.50 / 4.50 / 5.50')

        if (tpCost < 2000) then
            echoInfo('[Rhongomiant i119 III] Ignored defence increased to 25%', 0.5)
        elseif (tpCost < 3000) then
            echoInfo('[Rhongomiant i119 III] Ignored defence increased to 45%', 0.5)
        else            
            echoInfo('[Rhongomiant i119 III] Ignored defence increased to 75%', 0.5)
        end
    end

    if (spell == "Blade: Hi") then
        echoInfo('[Kannagi i119 III] Added 70% STR modifier (80% AGI/70% STR)')

        if (tpCost < 2000) then
            echoInfo('[Kannagi i119 III] Critical hit chance increased to 25%', 0.5)
        elseif (tpCost < 3000) then
            echoInfo('[Kannagi i119 III] Critical hit chance increased to 45%', 0.5)
        else            
            echoInfo('[Kannagi i119 III] Critical hit chance increased to 65%', 0.5)
        end
    end

    if (spell == "Tachi: Enpi") then
        echoInfo('Free blink shadow')
    end

    if (spell == "Tachi: Fudo") then
        echoInfo('[Masamune i119 III] Added 25% DEX modifier (80% STR/25% DEX)')

        if (tpCost < 2000) then
            echoInfo('[Masamune i119 III] fTP increased to 5.75 (~55% increase)', 0.5)
        elseif (tpCost < 3000) then
            echoInfo('[Masamune i119 III] fTP increased to 8.75 (~55% increase)', 0.5)
        else            
            echoInfo('[Masamune i119 III] fTP increased to 12.00 (50% increase)', 0.5)
        end
    end

    if (spell== "Omniscience") then
        echoInfo('Monster MAB reduction now -50 instead of -10')
    end

    if (spell == "Tartarus Torpor") then 
        echoInfo('AOE Magic WS, with Plague & Sleep')
    end

    if (spell == "Garland of Bliss") then
        echoInfo('Heals SMN Avatar for 5%')
    end

    if (spell == "Myrkr") then
        echoInfo('[Hvergelmir i119 III] Removes all negative status effects, including Doom')
    end
end