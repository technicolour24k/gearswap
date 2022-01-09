-- Config files

-- Server details - Used by default.lua to find proper server LUAs
server = "NocSouls"

-- Display info in chat settings
config = {}
config.showSpellInfo = false --Show various facets of spell info - can be overwritten in individual LUAs
config.showFastCastInfo = true --Display Fast Cast info
config.showCancelInfo = true --Display info when cancelling buffs
config.oneClickRemedies = true --Activate remedies with a single command - defined in individual LUAs

enspell_list = S{"Enstone", "Enwater", "Enaero", "Enfire", "Enblizzard", "Enthunder", "Enlight","Endark"} --Store enspells for easily cancelling
conserveMP_list = --Store spells that get no benefit from Potency or anything outside ConserveMP
    S {
    "Protect",
    "Protect II",
    "Protect III",
    "Protect IV",
    "Protect V",
    "Protectra",
    "Protectra II",
    "Protectra III",
    "Protectra IV",
    "Protectra V",
    "Shell",
    "Shell II",
    "Shell III",
    "Shell IV",
    "Shell V",
    "Shellra",
    "Shellra II",
    "Shellra III",
    "Shellra IV",
    "Shellra V",
    "Haste",
    "Haste II",
    "Dia",
    "Dia II",
    "Dia III",
    "Diaga",
    "Blaze Spikes",
    "Ice Spikes",
    "Shock Spikes",
    "Impact",
    "Bio",
    "Bio II",
    "Bio III",
    "Refresh",
    "Refresh II"
}

--Below 4 lists are used by oneClickRemedies to know which statuses get assigned to which medicine
remedy_list = {"Blind","Paralyze","Silence","Poison"}
remedyOintment_list = {"Blind","Paralyze","Silence","Poison", "Disease", "Plague"}
panacea_list = {"Bind", "Bio", "Burn", "Choke", "Dia", "Flash", "Frost", "Gravity", "Rasp", "Slow", "Stun", "Weight"}
holyWater_list = {"Curse","Doom"}