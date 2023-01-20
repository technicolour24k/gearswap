-- Config files

-- Server details - Used by default.lua to find proper server LUAs
server = "NocSouls"
serverStage = "1"

-- Display info in chat settings
config = {}
config.showSpellInfo = false --Show various facets of spell info - can be overwritten in individual LUAs
config.showFastCastInfo = false --Display Fast Cast info
config.showCancelInfo = true --Display info when cancelling buffs
config.oneClickRemedies = true --Activate remedies with a single command - defined in individual LUAs

enspell_list = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Enlight","Endark"} --Store enspells for easily cancelling
conserveMP_list = --Store spells that get no benefit from Potency or anything outside ConserveMP
    S {
    "Protect","Protect II","Protect III","Protect IV","Protect V","Protectra","Protectra II","Protectra III","Protectra IV","Protectra V",
    "Shell","Shell II","Shell III","Shell IV","Shell V","Shellra","Shellra II","Shellra III","Shellra IV","Shellra V",
    "Haste","Haste II",
    "Dia","Dia II","Dia III","Diaga",
    "Blaze Spikes","Ice Spikes","Shock Spikes",
    "Refresh","Refresh II"
}

eleWheel_list = S{	"Hyoton: Ichi", "Hyoton: Ni", "Hyoton: San",
"Katon: Ichi", "Katon: Ni", "Katon: San",
"Doton: Ichi", "Doton: Ni", "Doton: San",
"Raiton: Ichi", "Raiton: Ni", "Raiton: San",
"Suiton: Ichi", "Suiton: Ni", "Suiton: San",
"Huton: Ichi", "Huton: Ni", "Huton: San"					
}

CureSpells = S{	'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Cure V', 'Cure VI',
'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Curaga V',
'Cura', 'Cura II', 'Cura III'}

StatSpells = S{	'Poisona', 'Paralyna', 'Blindna', 'Silena', 'Stona', 'Viruna', 'Erase'}
RegenSpells = S{'Regen', 'Regen II', 'Regen III', 'Regen IV', 'Regen V'}
Helixes = S{'Geohelix','Hydrohelix','Anemohelix','Pyrohelix','Cryohelix','Ionohelix','Noctohelix','Luminohelix'}
Storms = S{'Sandstorm','Rainstorm','Windstorm','Firestorm','Hailstorm','Thunderstorm','Voidstorm','Aurorastorm'}

--Below 4 lists are used by oneClickRemedies to know which statuses get assigned to which medicine
remedy_list = {"Blind","Paralysis","Silence","Poison"}
remedyOintment_list = {"Disease", "Plague"}
panacea_list = {"Bind", "Bio", "Burn", "Choke", "Dia", "Flash", "Frost", "Gravity", "Rasp", "Slow", "Stun", "Weight", "Attack Down", "Defense Down", "STR Down", "AGI Down", "DEX Down", "VIT Down","INT Down", "MND Down"}
holyWater_list = {"Curse","Doom"}

activeArts = "default"
