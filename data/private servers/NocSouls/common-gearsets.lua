function init_gear_sets(job)

	infoLog("Gearsets Initialising...")
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	
	-- Weapons sets
	sets.weapons={}

	sets.weapons.WAR = {}
	sets.weapons.WAR['Great Axe'] = {main="", sub=""}
	sets.weapons.WAR['Axe'] = {main="",sub=""}
	
	sets.weapons.MNK = {}
	sets.weapons.MNK['Hand-to-Hand'] = {main=""}

	sets.weapons.WHM = {}
	sets.weapons.WHM['Dual Wield'] = {main="",sub=""}
	sets.weapons.WHM['Healing'] = {main="",sub=""}

	sets.weapons.RDM = {}
	sets.weapons.RDM['Melee'] = {main="Murgleis",sub="Genbu's Shield"}
	sets.weapons.RDM['Mage'] = {main="",sub=""}

	sets.weapons.BLM = {}
	sets.weapons.BLM['Elemental'] = {main="Laevateinn",sub="Elan Strap"}
	
	sets.weapons.THF = {}
	sets.weapons.THF['Daggers'] = {main="Twashtar",sub="Sandung"}
	
	sets.weapons.PLD = {}
	sets.weapons.PLD['Sword'] = {main="Burtgang", sub="Aegis"}
	sets.weapons.PLD['Great Sword'] = {main="Ragnarok", sub="Immolation Grip"}
	
	sets.weapons.DRK = {}
	sets.weapons.DRK['Scythe'] = {main="Apocalypse",sub="Immolation Grip"}
	sets.weapons.DRK['Great Sword'] = {main="Ragnarok",sub="Immolation Grip"}
	
	sets.weapons.BST = {}
	sets.weapons.BST['Axe'] = {}

	sets.weapons.BRD = {}
	sets.weapons.BRD['Dagger'] = {main="", sub=""}
	sets.weapons.BRD['Sword'] = {main="", sub=""}
	sets.weapons.BRD['Horn'] = {ranged=""}
	sets.weapons.BRD['Harp'] = {ranged=""}

	sets.weapons.RNG = {}
	sets.weapons.RNG['Archery'] = {ranged=""}
	sets.weapons.RNG['XBow'] = {ranged=""}
	sets.weapons.RNG['Gun'] = {ranged=""}
	
	sets.weapons.SAM = {}
	sets.weapons.SAM['Great Katana'] = {main = "Amanomurakumo", sub="Utu Grip", ranged="Hangaku-no-Yumi"}
	sets.weapons.SAM['Archery'] = {}
	sets.weapons.SAM['Polearm'] = {}
	
	sets.weapons.NIN = {}
	sets.weapons.NIN['Melee'] = {main="", sub=""}
	sets.weapons.NIN['Nukes'] = {main="", sub=""}
	
	sets.weapons.DRG = {}
	sets.weapons.DRG['Polearm'] = {main="",sub=""}

	sets.weapons.SMN = {}
	sets.weapons.SMN['Staff'] = {main="Nirvana", sub="Elan Strap"}

	sets.weapons.BLU = {}
	sets.weapons.BLU['Sword'] = {main="Fettering Blade", sub="Beatific Shield"}
	
	sets.weapons.COR = {}
	sets.weapons.COR['Daggers'] = {main="", sub=""}
	sets.weapons.COR['Gun'] = {ranged=""}
	
	sets.weapons.PUP = {}
	sets.weapons.PUP['Hand-to-Hand'] = {main=""}

	sets.weapons.DNC = {}
	sets.weapons.DNC['Daggers'] = {main="Twashtar",sub="Terpsichore"}

	sets.weapons.SCH = {}
	sets.weapons.SCH['Elemental'] = {main="",sub=""}
	sets.weapons.SCH['Healing'] = {main="",sub=""}

	-- Retail only jobs
	sets.weapons.GEO = {}
	sets.weapons.GEO['Geomancy'] = {main="", sub=""}
	sets.weapons.GEO['Elemental'] = {main="", sub=""}
	sets.weapons.GEO['Healing'] = {main="", sub=""}

	sets.weapons.RUN = {}
	sets.weapons.RUN['Sword'] = {main="Fettering Blade", sub="Beatific Shield"}
	sets.weapons.RUN['Great Sword'] = {main="Ragnarok", sub="Immolation Grip"}


	--AF/Relic/Empy set piece variables to be usable as references in other LUA files
	--WAR
	WAR_AF_HEAD = "Pummeler's Mask +1"
	WAR_AF_BODY = "Pummeler's Lorica +1"
	WAR_AF_HANDS = "Pumm. Mufflers +1"
	WAR_AF_LEGS = "Pumm. Cuisses +1"
	WAR_AF_FEET = "Pumm. Calligae +1"
	WAR_RELIC_HEAD = "Agoge Mask +1"
	WAR_RELIC_BODY = "Agoge Lorica +1"
	WAR_RELIC_HANDS = "Agoge Mufflers +1"
	WAR_RELIC_LEGS = "Agoge Cuisses +1"
	WAR_RELIC_FEET = "Agoge Calligae +1"
	WAR_EMPYREAN_HEAD = "Boii Mask +1"
	WAR_EMPYREAN_BODY = "Boii Lorica +1"
	WAR_EMPYREAN_HANDS = "Boii Mufflers +1"
	WAR_EMPYREAN_LEGS = "Boii Cuisses +1"
	WAR_EMPYREAN_FEET = "Boii Calligae +1"
	
	--MNK
	MNK_AF_HEAD = "Anchorite's Crown +1"
	MNK_AF_BODY = "Anchorite's Cyclas +1"
	MNK_AF_HANDS = "Anchorite's Gloves +1"
	MNK_AF_LEGS = "Anchorite's Hose +1"
	MNK_AF_FEET = "Anchorite's Gaiters +1"
	MNK_RELIC_HEAD = "Hesychast's Crown +1"
	MNK_RELIC_BODY = "Hesychast's Cyclas +1"
	MNK_RELIC_HANDS = "Hesychast's Gloves +1"
	MNK_RELIC_LEGS = "Hesychast's Hose +1"
	MNK_RELIC_FEET = "Hesychast's Gaiters +1"
	MNK_EMPYREAN_HEAD = "Bhikku Crown +1"
	MNK_EMPYREAN_BODY = "Bhikku Cyclas +1"
	MNK_EMPYREAN_HANDS = "Bhikku Gloves +1"
	MNK_EMPYREAN_LEGS = "Bhikku Hose +1"
	MNK_EMPYREAN_FEET = "Bhikku Gaiters +1"

	--WHM
	WHM_AF_HEAD = "Theophany Cap +1"
	WHM_AF_BODY = "Theophany Briault +1"
	WHM_AF_HANDS = "Theophany Mitts +1"
	WHM_AF_LEGS = "Theophany Pantaloons +1"
	WHM_AF_FEET = "Theophany Duckbills +1"
	WHM_RELIC_HEAD = "Piety Cap +1"
	WHM_RELIC_BODY = "Piety Briault +1"
	WHM_RELIC_HANDS = "Piety Mitts +1"
	WHM_RELIC_LEGS = "Piety Pantaloons +1"
	WHM_RELIC_FEET = "Piety Duckbills +1"
	WHM_EMPYREAN_HEAD = "Ebers Cap +1"
	WHM_EMPYREAN_BODY = "Ebers Briault +1"
	WHM_EMPYREAN_HANDS = "Ebers Mitts +1"
	WHM_EMPYREAN_LEGS = "Ebers Pantaloons +1"
	WHM_EMPYREAN_FEET = "Ebers Duckbills +1"

	--BLM
	BLM_AF_HEAD = "Spaekona's Petasos +2"
	BLM_AF_BODY = "Spaekona's Coat +2"
	BLM_AF_HANDS = "Spaekona's Gloves +2"
	BLM_AF_LEGS = "Spaekona's Chausses +2"
	BLM_AF_FEET = "Spaekona's Sabots +2"
	BLM_RELIC_HEAD = "Archmage's Petasos +1"
	BLM_RELIC_BODY = "Archmage's Coat +1"
	BLM_RELIC_HANDS = "Archmage's Gloves +1"
	BLM_RELIC_LEGS = "Archmage's Chausses +1"
	BLM_RELIC_FEET = "Archmage's Sabots +1"
	BLM_EMPYREAN_HEAD = "Wicce Petasos"
	BLM_EMPYREAN_BODY = "Wicce Coat"
	BLM_EMPYREAN_HANDS = "Wicce Gloves"
	BLM_EMPYREAN_LEGS = "Wicce Chausses"
	BLM_EMPYREAN_FEET = "Wicce Sabots"

	--RDM
	RDM_AF_HEAD = "Atrophy Chapeau +2"
	RDM_AF_BODY = "Atrophy Tabard +2"
	RDM_AF_HANDS = "Atrophy Gloves +2"
	RDM_AF_LEGS = "Atrophy Tights +2"
	RDM_AF_FEET = "Atrophy Boots +2"
	RDM_RELIC_HEAD = "Vitiation Chapeau +1"
	RDM_RELIC_BODY = "Vitiation Tabard +1"
	RDM_RELIC_HANDS = "Vitiation Gloves +1"
	RDM_RELIC_LEGS = "Vitiation Tights +1"
	RDM_RELIC_FEET = "Vitiation Boots +1"
	RDM_EMPYREAN_HEAD = "Lethargy Chappel +1"
	RDM_EMPYREAN_BODY = "Lethargy Sayon +1"
	RDM_EMPYREAN_HANDS = "Lethargy Gantherots +1"
	RDM_EMPYREAN_LEGS = "Lethargy Fuseau +1"
	RDM_EMPYREAN_FEET = "Lethargy Houseaux +1"

	--THF
	THF_AF_HEAD = "Pillager's Bonnet +3"
	THF_AF_BODY = "Pillager's Vest +3"
	THF_AF_HANDS = "Pillager's Armlets +3"
	THF_AF_LEGS = "Pillager's Culottes +3"
	THF_AF_FEET = "Pillager's Poulaines +3"
	THF_RELIC_HEAD = "Plunderer's Bonnet +1"
	THF_RELIC_BODY = "Plunderer's Vest +1"
	THF_RELIC_HANDS = "Plunderer's Armlets +1"
	THF_RELIC_LEGS = "Plunderer's Culottes +1"
	THF_RELIC_FEET = "Plunderer's Poulaines +1"
	THF_EMPYREAN_HEAD = "Skulker's Bonnet +1"
	THF_EMPYREAN_BODY = "Skulker's Vest +1"
	THF_EMPYREAN_HANDS = "Skulker's Armlets +1"
	THF_EMPYREAN_LEGS = "Skulker's Culottes +1"
	THF_EMPYREAN_FEET = "Skulker's Poulaines +1"

	--PLD
	PLD_AF_HEAD = "Reverence Coronet +3"
	PLD_AF_BODY = "Reverence Surcoat +3"
	PLD_AF_HANDS = "Reverence Gauntlets +3"
	PLD_AF_LEGS = "Reverence Breeches+3"
	PLD_AF_FEET = "Reverence Leggings +3"
	PLD_RELIC_HEAD = "Caballarius Coronet +1"
	PLD_RELIC_BODY = "Caballarius Surcoat+1"
	PLD_RELIC_HANDS = "Caballarius Gauntlets +1"
	PLD_RELIC_LEGS = "Caballarius Breeches +1"
	PLD_RELIC_FEET = "Caballarius Leggings +1"
	PLD_EMPYREAN_HEAD = "Chevalier's Armet +1"
	PLD_EMPYREAN_BODY = "Chevalier's Cuirass +1"
	PLD_EMPYREAN_HANDS = "Chevalier's Gauntlets +1"
	PLD_EMPYREAN_LEGS = "Chevalier's Cuisses +1"
	PLD_EMPYREAN_FEET = "Chevalier's Sabatons +1"

	--DRK
	DRK_AF_HEAD = "Ignominy Burgeonet +2"
	DRK_AF_BODY = "Ignominy Cuirass +2"
	DRK_AF_HANDS = "Ignominy Gauntlets +2"
	DRK_AF_LEGS = "Ignominy Flanchard +2"
	DRK_AF_FEET = "Ignominy Sollerets +2"
	DRK_RELIC_HEAD = "Fallen's Burgeonet +1"
	DRK_RELIC_BODY = "Fallen's Cuirass +1"
	DRK_RELIC_HANDS = "Fallen's Finger Gauntlets +1"
	DRK_RELIC_LEGS = "Fallen's Flanchard +1"
	DRK_RELIC_FEET = "Fallen's Sollerets +1"
	DRK_EMPYREAN_HEAD = "Heathen's Burgeonet"
	DRK_EMPYREAN_BODY = "Heathen's Cuirass"
	DRK_EMPYREAN_HANDS = "Heathen's Gauntlets"
	DRK_EMPYREAN_LEGS = "Heathen's Flanchard"
	DRK_EMPYREAN_FEET = "Heathen's Sollerets"

	--BST
	BST_AF_HEAD = "Totemic Helm +1"
	BST_AF_BODY = "Totemic Jackcoat +1"
	BST_AF_HANDS = "Totemic Gloves +1"
	BST_AF_LEGS = "Totemic Trousers +1"
	BST_AF_FEET = "Totemic Gaiters +1"
	BST_RELIC_HEAD = "Ankusa Helm +1"
	BST_RELIC_BODY = "Ankusa Jackcoat +1"
	BST_RELIC_HANDS = "Ankusa Gloves +1"
	BST_RELIC_LEGS = "Ankusa Trousers +1"
	BST_RELIC_FEET = "Ankusa Gaiters +1"
	BST_EMPYREAN_HEAD = "Nukumi Cabasset +1"
	BST_EMPYREAN_BODY = "Nukumi Gausape +1"
	BST_EMPYREAN_HANDS = "Nukumi Manoplas +1"
	BST_EMPYREAN_LEGS = "Nukumi Quijotes +1"
	BST_EMPYREAN_FEET = "Nukumi Ocreae +1"

	--BRD
	BRD_AF_HEAD = "Brioso Roundlet +1"
	BRD_AF_BODY = "Brioso Justaucorps +1"
	BRD_AF_HANDS = "Brioso Cuffs +1"
	BRD_AF_LEGS = "Brioso Cannions +1"
	BRD_AF_FEET = "Brioso Slippers +1"
	BRD_RELIC_HEAD = "Bihu Roundlet +1"
	BRD_RELIC_BODY = "Bihu Justaucorps +1"
	BRD_RELIC_HANDS = "Bihu Cuffs +1"
	BRD_RELIC_LEGS = "Bihu Cannions +1"
	BRD_RELIC_FEET = "Bihu Slippers +1"
	BRD_EMPYREAN_HEAD = "Fili Calot +1"
	BRD_EMPYREAN_BODY = "Fili Hongreline +1"
	BRD_EMPYREAN_HANDS = "Fili Manchettes +1"
	BRD_EMPYREAN_LEGS = "Fili Rhingrave +1"
	BRD_EMPYREAN_FEET = "Fili Cothurnes +1"

	--RNG
	RNG_AF_HEAD = "Orion Beret +1"
	RNG_AF_BODY = "Orion Jerkin +1"
	RNG_AF_HANDS = "Orion Bracers +1"
	RNG_AF_LEGS = "Orion Braccae +1"
	RNG_AF_FEET = "Orion Socks +1"
	RNG_RELIC_HEAD = "Arcadian Beret +1"
	RNG_RELIC_BODY = "Arcadian Jerkin +1"
	RNG_RELIC_HANDS = "Arcadian Bracers +1"
	RNG_RELIC_LEGS = "Arcadian Braccae +1"
	RNG_RELIC_FEET = "Arcadian Socks +1"
	RNG_EMPYREAN_HEAD = "Amini Gapette +1"
	RNG_EMPYREAN_BODY = "Amini Caban +1"
	RNG_EMPYREAN_HANDS = "Amini Glovelettes +1"
	RNG_EMPYREAN_LEGS = "Amini Brague +1"
	RNG_EMPYREAN_FEET = "Amini Bottillons +1"

	--SAM
	SAM_AF_HEAD = "Wakido Kabuto +2"
	SAM_AF_BODY = "Wakido Domaru +2"
	SAM_AF_HANDS = "Wakido Kote +2"
	SAM_AF_LEGS = "Wakido Haidate +2"
	SAM_AF_FEET = "Wakido Sune-Ate +2"
	SAM_RELIC_HEAD = "Sakonji Kabuto +1"
	SAM_RELIC_BODY = "Sakonji Domaru +1"
	SAM_RELIC_HANDS = "Sakonji Kote +1"
	SAM_RELIC_LEGS = "Sakonji Haidate +1"
	SAM_RELIC_FEET = "Sakonji Sune-Ate +1"
	SAM_EMPYREAN_HEAD = "Kasuga Kabuto +1"
	SAM_EMPYREAN_BODY = "Kasuga Domaru +1"
	SAM_EMPYREAN_HANDS = "Kasuga Kote +1"
	SAM_EMPYREAN_LEGS = "Kasuga Haidate +1"
	SAM_EMPYREAN_FEET = "Kasuga Sune-Ate +1"

	--NIN
	NIN_AF_HEAD = "Hachiya Hatsuburi +1"
	NIN_AF_BODY = "Hachiya Chainmail +1"
	NIN_AF_HANDS = "Hachiya Tekko +1"
	NIN_AF_LEGS = "Hachiya Hakama +1"
	NIN_AF_FEET = "Hachiya Kyahan +1"
	NIN_RELIC_HEAD = "Mochizuki Hatsuburi +1"
	NIN_RELIC_BODY = "Mochizuki Chainmail +1"
	NIN_RELIC_HANDS = "Mochizuki Tekko +1"
	NIN_RELIC_LEGS = "Mochizuki Hakama +1"
	NIN_RELIC_FEET = "Mochizuki Kyahan +1"
	NIN_EMPYREAN_HEAD = "Hattori Zukin +1"
	NIN_EMPYREAN_BODY = "Hattori Ningi +1"
	NIN_EMPYREAN_HANDS = "Hattori Tekko +1"
	NIN_EMPYREAN_LEGS = "Hattori Hakama +1"
	NIN_EMPYREAN_FEET = "Hattori Kyahan +1"

	--DRG
	DRG_AF_HEAD = "Vishap Armet +1"
	DRG_AF_BODY = "Vishap Mail +1"
	DRG_AF_HANDS = "Vishap Finger Gauntlets +1"
	DRG_AF_LEGS = "Vishap Brais +1"
	DRG_AF_FEET = "Vishap Greaves +1"
	DRG_RELIC_HEAD = "Pteroslaver Armet +1"
	DRG_RELIC_BODY = "Pteroslaver Mail +1"
	DRG_RELIC_HANDS = "Pteroslaver Finger Gauntlets +1"
	DRG_RELIC_LEGS = "Pteroslaver Brais +1"
	DRG_RELIC_FEET = "Pteroslaver Greaves +1"
	DRG_EMPYREAN_HEAD = "Peltast's Mezail +1"
	DRG_EMPYREAN_BODY = "Peltast's Plackart +1"
	DRG_EMPYREAN_HANDS = "Peltast's Vambraces +1"
	DRG_EMPYREAN_LEGS = "Peltast's Cuissots +1"
	DRG_EMPYREAN_FEET = "Peltast's Schynbalds +1"

	--SMN
	SMN_AF_HEAD = "Convoker's Horn +2"
	SMN_AF_BODY = "Convoker's Doublet +3"
	SMN_AF_HANDS = "Convoker's Bracers +2"
	SMN_AF_LEGS = "Convoker's Spats +2"
	SMN_AF_FEET = "Convoker's Pigaches +2"
	SMN_RELIC_HEAD = "Glyphic Horn +1"
	SMN_RELIC_BODY = "Glyphic Doublet +1"
	SMN_RELIC_HANDS = "Glyphic Bracers +1"
	SMN_RELIC_LEGS = "Glyphic Spats +1"
	SMN_RELIC_FEET = "Glyphic Pigaches +1"
	SMN_EMPYREAN_HEAD = "Beckoner's Horn +1"
	SMN_EMPYREAN_BODY = "Beckoner's Doublet +1"
	SMN_EMPYREAN_HANDS = "Beckoner's Bracers +1"
	SMN_EMPYREAN_LEGS = "Beckoner's Spats +1"
	SMN_EMPYREAN_FEET = "Beckoner's Pigaches +1"

	--BLU
	BLU_AF_HEAD = "Assimilator's Keffiyeh +1"
	BLU_AF_BODY = "Assimilator's Jubbah +1"
	BLU_AF_HANDS = "Assimilator's Bazubands +1"
	BLU_AF_LEGS = "Assimilator's Shalwar +1"
	BLU_AF_FEET = "Assimilator's Charuqs +1"
	BLU_RELIC_HEAD = "Luhlaza Keffiyeh +1"
	BLU_RELIC_BODY = "Luhlaza Jubbah +1"
	BLU_RELIC_HANDS = "Luhlaza Bazubands +1"
	BLU_RELIC_LEGS = "Luhlaza Shalwar +1"
	BLU_RELIC_FEET = "Luhlaza Charuqs +1"
	BLU_EMPYREAN_HEAD = "Hashishin Kavuk +1"
	BLU_EMPYREAN_BODY = "Hashishin Mintan +1"
	BLU_EMPYREAN_HANDS = "Hashishin Bazubands +1"
	BLU_EMPYREAN_LEGS = "Hashishin Tayt +1"
	BLU_EMPYREAN_FEET = "Hashishin Basmak +1"

	--COR
	COR_AF_HEAD = "Laksamana's Tricorne +1"
	COR_AF_BODY = "Laksamana's Frac +1"
	COR_AF_HANDS = "Laksamana's Gants +1"
	COR_AF_LEGS = "Laksamana's Trews +1"
	COR_AF_FEET = "Laksamana's Bottes +1"
	COR_RELIC_HEAD = "Lanun Tricorne +1"
	COR_RELIC_BODY = "Lanun Frac +1"
	COR_RELIC_HANDS = "Lanun Gants +1"
	COR_RELIC_LEGS = "Lanun Trews +1"
	COR_RELIC_FEET = "Lanun Bottes +1"
	COR_EMPYREAN_HEAD = "Chasseur's Tricorne +1"
	COR_EMPYREAN_BODY = "Chasseur's Frac +1"
	COR_EMPYREAN_HANDS = "Chasseur's Gants +1"
	COR_EMPYREAN_LEGS = "Chasseur's Trews +1"
	COR_EMPYREAN_FEET = "Chasseur's Bottes +1"

	--PUP
	PUP_AF_HEAD = "Foire Taj +1"
	PUP_AF_BODY = "Foire Tobe +1"
	PUP_AF_HANDS = "Foire Dastanas +1"
	PUP_AF_LEGS = "Foire Churidars +1"
	PUP_AF_FEET = "Foire Babouches +1"
	PUP_RELIC_HEAD = "Pitre Taj +1"
	PUP_RELIC_BODY = "Pitre Tobe +1"
	PUP_RELIC_HANDS = "Pitre Dastanas +1"
	PUP_RELIC_LEGS = "Pitre Churidars +1"
	PUP_RELIC_FEET = "Pitre Babouches +1"
	PUP_EMPYREAN_HEAD = "Karagoz Capello +1"
	PUP_EMPYREAN_BODY = "Karagoz Farsetto +1"
	PUP_EMPYREAN_HANDS = "Karagoz Guanti +1"
	PUP_EMPYREAN_LEGS = "Karagoz Pantaloni +1"
	PUP_EMPYREAN_FEET = "Karagoz Scarpe +1"

	--DNC
	DNC_AF_HEAD = "Maxixi Tiara +1"
	DNC_AF_BODY = "Maxixi Casaque +1"
	DNC_AF_HANDS = "Maxixi Bangles +1"
	DNC_AF_LEGS = "Maxixi Tights +1"
	DNC_AF_FEET = "Maxixi Toe Shoes +1"
	DNC_RELIC_HEAD = "Horos Tiara +1"
	DNC_RELIC_BODY = "Horos Casaque +1"
	DNC_RELIC_HANDS = "Horos Bangles +1"
	DNC_RELIC_LEGS = "Horos Tights +1"
	DNC_RELIC_FEET = "Horos Toe Shoes +1"
	DNC_EMPYREAN_HEAD = "Maculele Tiara +1"
	DNC_EMPYREAN_BODY = "Maculele Casaque +1"
	DNC_EMPYREAN_HANDS = "Maculele Bangles +1"
	DNC_EMPYREAN_LEGS = "Maculele Tights +1"
	DNC_EMPYREAN_FEET = "Maculele Toe Shoes +1"

	--SCH
	SCH_AF_HEAD = "Academic's Mortarboard +1"
	SCH_AF_BODY = "Academic's Gown +1"
	SCH_AF_HANDS = "Academic's Bracers +1"
	SCH_AF_LEGS = "Academic's Pants +1"
	SCH_AF_FEET = "Academic's Loafers +1"
	SCH_RELIC_HEAD = "Pedagogy Mortarboard +1"
	SCH_RELIC_BODY = "Pedagogy Gown +1"
	SCH_RELIC_HANDS = "Pedagogy Bracers +1"
	SCH_RELIC_LEGS = "Pedagogy Pants +1"
	SCH_RELIC_FEET = "Pedagogy Loafers +1"
	SCH_EMPYREAN_HEAD = "Arbatel Bonnet +1"
	SCH_EMPYREAN_BODY = "Arbatel Gown +1"
	SCH_EMPYREAN_HANDS = "Arbatel Bracers +1"
	SCH_EMPYREAN_LEGS = "Arbatel Pants +1"
	SCH_EMPYREAN_FEET = "Arbatel Loafers +1"

	--GEO
	GEO_AF_HEAD = "Geomancy Galero +1"
	GEO_AF_BODY = "Geomancy Tunic +1"
	GEO_AF_HANDS = "Geomancy Mitaines +1"
	GEO_AF_LEGS = "Geomancy Pants +1"
	GEO_AF_FEET = "Geomancy Sandals +1"
	GEO_RELIC_HEAD = "Bagua Galero +1"
	GEO_RELIC_BODY = "Bagua Tunic +1"
	GEO_RELIC_HANDS = "Bagua Mitaines +1"
	GEO_RELIC_LEGS = "Bagua Pants +1"
	GEO_RELIC_FEET = "Bagua Sandals +1"
	GEO_EMPYREAN_HEAD = "Azimuth Hood +1"
	GEO_EMPYREAN_BODY = "Azimuth Coat +1"
	GEO_EMPYREAN_HANDS = "Azimuth Gloves +1"
	GEO_EMPYREAN_LEGS = "Azimuth Tights +1"
	GEO_EMPYREAN_FEET = "Azimuth Gaiters +1"

	--RUN
	RUN_AF_HEAD = "Runeist Bandeau +1"
	RUN_AF_BODY = "Runeist Coat +1"
	RUN_AF_HANDS = "Runeist Mitons +1"
	RUN_AF_LEGS = "Runeist Trousers +1"
	RUN_AF_FEET = "Runeist Boots +1"
	RUN_RELIC_HEAD = "Futhark Bandeau +1"
	RUN_RELIC_BODY = "Futhark Coat +1"
	RUN_RELIC_HANDS = "Futhark Mitons +1"
	RUN_RELIC_LEGS = "Futhark Trousers +1"
	RUN_RELIC_FEET = "Futhark Boots +1"
	RUN_EMPYREAN_HEAD = "Erilaz Galea +1"
	RUN_EMPYREAN_BODY = "Erilaz Surcoat +1"
	RUN_EMPYREAN_HANDS = "Erilaz Gauntlets +1"
	RUN_EMPYREAN_LEGS = "Erilaz Leg Guards +1"
	RUN_EMPYREAN_FEET = "Erilaz Greaves +1"
	
	sets.misc = {}
	sets.misc.Sandy = {body = "Kingdom Aketon"}
	sets.misc.Windy = {body = "Federation Aketon"}
	sets.misc.Bastok = {body = "Republic Aketon"}
	sets.misc.Gardening = {body = "Overalls"}

	sets.misc.AllJobs = {}
	sets.misc.AllJobs.MAB = {
		ammo={ name="Erlene's Notebook", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		left_ring={ name="Acumen Ring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ring={ name="Dark Ring", augments={'Accuracy+5 Attack+5','Eva.+1 /Mag. Eva.+1','System: 1 ID: 131 Val: 7','Weapon skill damage +8%',}},
		left_ear={ name="Hecate's Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ear={ name="Novio Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		back={ name="Izdubar Mantle", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		neck={ name="Stoicheion Medal", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
	}

	sets.misc.AllJobs['DTDown'] = {
		neck="Loricate Torque +1", --6% DT
		left_ring="Defending Ring", --10% DT (16% total)
		back="Moonbeam Cape"
	}
	sets.misc.AllJobs['PDTDown'] = set_combine(sets.misc.AllJobs['DTDown'], {
		 right_ring="Patricius Ring", --5% PDT (21% total)
	})
	sets.misc.AllJobs['MDTDown'] = set_combine(sets.misc.AllJobs['DTDown'],{
		left_ear="Etiolation Earring", --3% MDT (19% total + Shell5 @29% MDT > 48% total)
		right_ring="Purity Ring" --4% MDT (23% total  + Shell5 @29% MDT > 52% total)
	})
	sets.misc.AllJobs['DTCombo'] = set_combine(sets.misc.AllJobs['PDTDown'], sets.misc.AllJobs['MDTDown'],{})
	sets.misc.AllJobs['Lv1'] = {
		main="Hoe",
		head="Cache-Nez",
		body="Chocobo Shirt",
		hands="Vagabond's Gloves",
		legs="Vagabond's Hose",
		feet="Vagabond's Boots"
	}
	sets.misc.AllJobs['Level 30'] = {}
	sets.misc.AllJobs['Level 30']['MAB'] = {
		head={name="Kosshin", augments={}},
		body={name="Savage Separates", augments={}},
		hands={name="Savage Gauntlets", augments={}},
		legs={name="Savage Loincloth", augments={}},
		feet={name="Savage Gaiters", augments={}},
		waist={name="Friar's Rope", augments={}},
		left_ring={ name="Eremite's Ring +1", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ring={ name="Eremite's Ring +1", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		back={name="Wizard's Mantle"}
	}

	sets.misc.AllJobs['Level 30']['Melee'] = {
		head={ name="Emperor Hairpin", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		body={name="Savage Separates",augments={}},
		hands={name="Savage Gauntlets",augments={}},
		legs={name="Savage Loincloth",augments={}},
		feet={name="Savage Gaiters",augments={}},
		neck={ name="Focus Collar", augments={'"Store TP"+2 "Subtle Blow"+2','Crit.hit rate+2','"Dbl.Atk."+2','"Triple Atk."+2',}},
		waist={name="Lizard Belt", augments={}},
		left_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		left_ring={ name="Rajas Ring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ring={ name="Castor's Ring", augments={'"Refresh"+10','"Fast Cast"+5','"Regen"+10','"Store TP"+5',}},
		back={name="Beater's Mantle", augments={}}
	}

	sets.misc.AllJobs['Level 50'] = {}
	sets.misc.AllJobs['Level 50']['MAB'] = {
		head={name="Kosshin", augments={}},
		body={name="Savage Separates", augments={}},
		hands={name="Savage Gauntlets", augments={}},
		legs={name="Savage Loincloth", augments={}},
		feet={name="Savage Gaiters", augments={}},
		waist={name="Friar's Rope", augments={}},
		right_ear={ name="Moldavite Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		left_ring={ name="Eremite's Ring +1", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ring={ name="Eremite's Ring +1", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		back={name="Wizard's Mantle"}
	}
	sets.misc.AllJobs['Level 50']['Melee'] = {
		ammo = {name="Optical Needle", augments={'Attack+10','Attack+10','Attack+10','Attack+10'}},
		head={ name="Emperor Hairpin", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		body={ name="Raven Jupon", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		hands={ name="Raven Bracers", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		legs={ name="Raven Hose", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		feet={ name="Raven Gaiters", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		neck={ name="Peacock Charm", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		waist={ name="Ryl.Kgt. Belt", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		left_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		left_ring={ name="Rajas Ring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ring={ name="Ulthalam's Ring", augments={'Attack+10','Attack+10','Attack+10','Attack+10',}},
		back={ name="Jaguar Mantle", augments={'Attack+10','Attack+10','Attack+10','Attack+10',}},
	}

	sets.misc.AllJobs['Level 75'] = {}
	sets.misc.AllJobs['Level 75']['MAB'] = {
		head= { name="Kosshin", augments={}},
		body= { name="Savage Separates", augments={}},
		hands= { name="Savage Gauntlets", augments={}},
		legs= { name="Savage Loincloth", augments={}},
		feet= { name="Savage Gaiters", augments={}},
		neck={ name="Jeweled Collar", augments={'Mag. crit. hit dmg. +7%','System: 1 ID: 131 Val: 6','Magic Damage +7','Magic crit. hit rate +7',}},
		waist= { name="Hachirin-no-Obi",augments={}},
		left_ear={ name="Moldavite Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ear={ name="Novio Earring", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		left_ring={ name="Eremite's Ring +1", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		right_ring={ name="Eremite's Ring +1", augments={'System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7','System: 1 ID: 131 Val: 7',}},
		back={name="Merciful Cape"}
	}
	sets.misc.AllJobs['Level 75']['Melee'] = {
		ammo = {name="Optical Needle", augments={'Attack+10','Attack+10','Attack+10','Attack+10'}},
		head={ name="Emperor Hairpin", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		body={ name="Raven Jupon", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		hands={ name="Raven Bracers", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		legs={ name="Raven Hose", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		feet={ name="Raven Gaiters", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		neck={ name="Peacock Charm", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		waist={ name="Ryl.Kgt. Belt", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		left_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ear={ name="Dodge Earring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		left_ring={ name="Rajas Ring", augments={'"Store TP"+5','"Store TP"+5','"Store TP"+5','"Store TP"+5',}},
		right_ring={ name="Ulthalam's Ring", augments={'Attack+10','Attack+10','Attack+10','Attack+10',}},
		back={ name="Jaguar Mantle", augments={'Attack+10','Attack+10','Attack+10','Attack+10',}},
	}

	sets.misc.AllJobs['TP'] = {
		left_ear={ name="Telos Earring", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
		right_ear={ name="Tati Earring", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
		back={ name="Moonbeam Cape", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
		ammo={ name="Staunch Tathlum", augments={'"Counter"+5','"Counter"+5','"Counter"+5','"Counter"+5',}},
		neck="Loricate Torque +1",
		left_ring={ name="Defending Ring", augments={'"Regen"+20','"Regen"+20','"Regen"+20','"Regen"+20',}},
		right_ring="Patricius Ring",
	}
	
	-- Generic precast sets
	sets.precast ={}
	sets.common = {}
    sets.common.precast = {} 
    sets.common.precast.FastCast = {}
	sets.common.precast.FastCast.Default = {
		left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
	}
	
	sets.common.precast.FastCast['Divine Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Healing Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Enhancing Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Enfeebling Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Elemental Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Dark Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Summoning Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Ninjutsu'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Singing'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['String'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Wind'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Blue Magic'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Geomancy'] = set_combine(sets.common.precast.FastCast.Default,{})
    sets.common.precast.FastCast['Handbell'] = set_combine(sets.common.precast.FastCast.Default,{})
	
	
	-- Generic midcast sets
	sets.midcast={}
	sets.common.midcast = {}
    sets.common.midcast.EnhancingDuration = {}
	sets.common.midcast.EnfeeblingDuration = {
		left_ring={name="Scintillant Ring", augments={'"Drain" and "Aspir" potency +3','Enfb.mag. skill +3','Mag. Acc+7 /Mag. Dmg.+7','System: 1 ID: 1251 Val: 9',}},
		right_ring={name="Scintillant Ring", augments={'"Drain" and "Aspir" potency +2','Enfb.mag. skill +7','Mag. Acc+2 /Mag. Dmg.+2','System: 1 ID: 1251 Val: 8',}},	
	}
    sets.common.midcast['Divine Magic'] = {}
	sets.common.midcast['Healing Magic'] = {}
	sets.common.midcast['Enhancing Magic'] = set_combine(sets.common.midcast.EnhancingDuration,{})
	sets.common.midcast['Enfeebling Magic'] = set_combine(sets.common.midcast.EnfeeblingDuration,{})
	sets.common.midcast['Elemental Magic'] = set_combine(sets.misc.AllJobs.MAB, {})
	sets.common.midcast['Dark Magic'] = {}
	sets.common.midcast['Summoning Magic'] = {}
	sets.common.midcast['Ninjutsu'] = {}
	sets.common.midcast['Singing'] = {}
	sets.common.midcast['String'] = {}
	sets.common.midcast['Wind'] = {}
	sets.common.midcast['Blue Magic'] = {}
	sets.common.midcast['Geomancy'] = {}
	sets.common.midcast['Handbell'] = {}   
    sets.common.midcast.Stoneskin = set_combine(sets.common.midcast.EnhancingDuration,{})
    sets.common.midcast.Aquaveil = set_combine(sets.common.midcast.EnhancingDuration,{})
    sets.common.midcast.Refresh = set_combine(sets.common.midcast.EnhancingDuration,{})
    sets.common.midcast.Phalanx = set_combine(sets.common.midcast.EnhancingDuration,{})
	sets.common.midcast.Enspell = set_combine(sets.common.midcast.EnhancingDuration,{
		sub={ name="Warlock's Shield", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		head={ name="Copper Hairpin", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		neck={ name="Justice Badge", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		left_ear={ name="Silver Earring", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		right_ear={ name="Silver Earring", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		left_ring={ name="Copper Ring", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		right_ring={ name="Copper Ring", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},
		back={ name="Shaper's Shawl", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},		
		waist={ name="Friar's Rope", augments={'Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10','Sword enhancement spell damage +10',}},		
	})
	sets.common.midcast.ConserveMP = set_combine(sets.common.precast.FastCast.Default, {
		hands = "Vagabond's Gloves",
		legs = "Vagabond's Hose",
		feet = "Vagabond's Boots"
	})
	sets.common.midcast.DrainAspir = {
		left_ring={name="Scintillant Ring", augments={'"Drain" and "Aspir" potency +3','Enfb.mag. skill +3','Mag. Acc+7 /Mag. Dmg.+7','System: 1 ID: 1251 Val: 9',}},
		right_ring={name="Scintillant Ring", augments={'"Drain" and "Aspir" potency +2','Enfb.mag. skill +7','Mag. Acc+2 /Mag. Dmg.+2','System: 1 ID: 1251 Val: 8',}}
	}
	
	sets.aftercast ={}
	sets.common.aftercast = {}
	
	sets.Obis = {}
	sets.Obis.AIO = {waist = "Hachirin-no-Obi"}
    sets.Obis.Fire = set_combine(sets.Obis.AIO, {waist="Karin Obi"})
    sets.Obis.Earth = set_combine(sets.Obis.AIO, {waist = "Dorin Obi"})
    sets.Obis.Water = set_combine(sets.Obis.AIO, {waist="Suirin Obi"})
    sets.Obis.Wind = set_combine(sets.Obis.AIO, {waist="Furin Obi"})
    sets.Obis.Ice = set_combine(sets.Obis.AIO, {waist="Hyorin Obi"})
    sets.Obis.Lightning = set_combine(sets.Obis.AIO, {waist="Rairin Obi"})
    sets.Obis.Light = set_combine(sets.Obis.AIO, {waist="Korin Obi"})
    sets.Obis.Dark = set_combine(sets.Obis.AIO, {waist="Anrin Obi"})

	sets.JobAbility = {}
	sets.WeaponSkills = {}
	sets.WeaponSkills['Fotia'] = {
		neck = "Fotia Gorget",
		waist = "Fotia Belt"
	}
	sets.WeaponSkills['AllJobsWS'] = {
		left_ring={ name="Dark Ring", augments={'Accuracy+5 Attack+5','Eva.+1 /Mag. Eva.+1','System: 1 ID: 131 Val: 7','Weapon skill damage +8%',}},
		right_ring={ name="Dark Ring", augments={'Accuracy+7 Attack+7','Eva.+5 /Mag. Eva.+5','System: 1 ID: 131 Val: 2','Weapon skill damage +10%',}},
	}

	send_command('gs-validate')
end