# gearswap
Collection of gearswap LUAs

Default.lua:
    - Uses the includes/config file to determine what set of gearswaps to load.
    - Begins by killing ALL binds and aliases and setting them up again
        - This needs a scripts/binds/%SERVER NAME% folder, with a CHAR_JOB text file (e.g. scripts/binds/retail/Kin_THF.txt) - Same with aliases
        - It will also try and execute scripts/windower-bindings, and scripts/aliases/common.txt - Would recommend these are both set up initially for best results
    - After setting up the bindings and aliases again, it will proceed to load your Gearswap file in the standard format: CHAR_JOB.lua
        - This will be based on the "server" parameter in includes/config.lua
            - If you want to play on retail servers, the server should be "retail" - Otherwise, it will assume private server


includes/config.lua:
    - Allows you to specify a server - to search for official FFXI server LUAs, use "retail".
    - As long as the server name has a corresponding folder, it doesn't really matter too much
    - Contains some generic config items for use in GS LUAs (e.g. showSpellInfo is referenced in my NocSouls/Kin_PLD LUA)

includes/common-functions.lua:
    - Anything used by multiple LUAs gets put here:
        - weathercheck(spell_element, set)
            - Used to determine whether or not to equip Obis and such for matching weather
        - cancelBuff (spell, casttime,FC,buff)
            - Needs cancel plugin
            - Calculates 75% cast time, based on FC amount passed in (specified in LUAs). At 75% "true" cast time, cancels a selection of buffs
                - Initial list: en-spells, stoneskin, spikes spells}
        - switchMacroSet (book, page)
            - Fairly self explanatory, changes macros around


Each server file should have a common-gearsets LUA also, to make use of any particular "all jobs" style gear. Many private servers have custom augment systems, which allow generic fast cast pieces - this would make a good candidate for that sort of system.