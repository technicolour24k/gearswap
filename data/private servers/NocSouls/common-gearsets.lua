function init_gear_sets(job)

	add_to_chat(25, "Gearsets Initialising...")
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
	sets.weapons.RDM['Dual Wield'] = {main="",sub=""}
	sets.weapons.RDM['Healing'] = {main="",sub=""}
	sets.weapons.RDM['SwordShield'] = {main="",sub=""}
	sets.weapons.RDM['Elemental'] = {main="",sub=""}

	sets.weapons.BLM = {}
	sets.weapons.BLM['Elemental'] = {main="",sub=""}
	
	sets.weapons.THF = {}
	sets.weapons.THF['Daggers'] = {main="Twashtar",sub="Mandau"}
	
	sets.weapons.PLD = {}
	sets.weapons.PLD['Sword'] = {main="Burtgang", sub="Aegis"}
	sets.weapons.PLD['Great Sword'] = {main="Ragnarok", sub="Uther's Grip"}
	
	sets.weapons.DRK = {}
	sets.weapons.DRK['Scythe'] = {main="",sub=""}
	sets.weapons.DRK['Great Sword'] = {main="Ragnarok", sub="Uther's Grip"}
	
	sets.weapons.BST = {}
	sets.weapons.BST['Axe'] = {}

	sets.weapons.BRD = {}
	sets.weapons.BRD['Dagger'] = {main="", sub=""}
	sets.weapons.BRD['Sword'] = {main="", sub=""}
	sets.weapons.BRD['Horn'] = { ranged=""}
	sets.weapons.BRD['Harp'] = {ranged=""}

	sets.weapons.RNG = {}
	sets.weapons.RNG['Archery'] = {ranged=""}
	sets.weapons.RNG['XBow'] = {ranged=""}
	sets.weapons.RNG['Gun'] = {ranged=""}
	
	sets.weapons.SAM = {}
	sets.weapons.SAM['Great Katana'] = {main = "Amanomurakumo", sub="Utu Grip", range="Hangaku-no-Yumi"}
	sets.weapons.SAM['Archery'] = {}
	sets.weapons.SAM['Polearm'] = {}
	
	sets.weapons.NIN = {}
	sets.weapons.NIN['Melee'] = {main="", sub=""}
	sets.weapons.NIN['Nukes'] = {main="", sub=""}
	
	sets.weapons.DRG = {}
	sets.weapons.DRG['Polearm'] = {main="",sub=""}

	sets.weapons.SMN = {}
	sets.weapons.SMN['Staff'] = {main="Nirvana", sub=""}

	sets.weapons.BLU = {}
	sets.weapons.BLU['Sword'] = {main="Fettering Blade", sub="Beatific Shield"}
	
	sets.weapons.COR = {}
	sets.weapons.COR['Daggers'] = {main="", sub=""}
	sets.weapons.COR['Gun'] = {ranged=""}
	
	sets.weapons.PUP = {}
	sets.weapons.PUP['Hand-to-Hand'] = {main=""}

	sets.weapons.DNC = {}
	sets.weapons.DNC['Daggers'] = {main="Vajra",sub="Mandau"}

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
	sets.weapons.RUN['Great Sword'] = {main="Ragnarok", sub="Uther's Grip"}
	
	
	-- Generic precast sets
    sets.precast = {} 
    sets.precast.FastCast = {}
	sets.precast.FastCast.Default = {
		left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
	}
	
	sets.precast.FastCast['Divine Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Healing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Enhancing Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Enfeebling Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FastCast.Default,{   })
    sets.precast.FastCast['Dark Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Summoning Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Ninjutsu'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Singing'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['String'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Wind'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Blue Magic'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Geomancy'] = set_combine(sets.precast.FastCast.Default,{})
    sets.precast.FastCast['Handbell'] = set_combine(sets.precast.FastCast.Default,{})
	
	
	-- Generic midcast sets
	sets.midcast = {}
    sets.midcast['Divine Magic'] = {}
	sets.midcast['Healing Magic'] = {}
	sets.midcast['Enhancing Magic'] = {}
	sets.midcast['Enfeebling Magic'] = {}
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Dark Magic'] = {}
	sets.midcast['Summoning Magic'] = {}
	sets.midcast['Ninjutsu'] = {}
	sets.midcast['Singing'] = {}
	sets.midcast['String'] = {}
	sets.midcast['Wind'] = {}
	sets.midcast['Blue Magic'] = {}
	sets.midcast['Geomancy'] = {}
	sets.midcast['Handbell'] = {}   
    sets.midcast.EnhancingDuration = {}
    sets.midcast.Stoneskin = set_combine(sets.midcast.EnhancingDuration,{legs="Haven Hose", waist="Seigel Sash"})
    sets.midcast.Aquaveil = set_combine(sets.midcast.EnhancingDuration,{})
    sets.midcast.Refresh = set_combine(sets.midcast.EnhancingDuration,{})
    sets.midcast.Phalanx = set_combine(sets.midcast.EnhancingDuration,{})
	sets.midcast.Enspell = set_combine(sets.midcast.EnhancingDuration,{
		head="Copper Hairpin",
		sub="Warlock's Shield",
		neck="Justice Badge",
		left_ring = "Copper Ring",
		right_ring = "Copper Ring",
		back = "Shaper's Shawl"
	})
	sets.midcast.ConserveMP = set_combine(sets.precast.FastCast.Default, {
		hands = "Vagabond's Gloves",
		legs = "Vagabond's Hose",
		feet = "Vagabond's Boots"
	})
	
	sets.aftercast = {}
	
	sets.Obis = {}
    sets.Obis.Fire = set_combine(sets.Obis.AIO, {waist="Karin Obi"})
    sets.Obis.Earth = set_combine(sets.Obis.AIO, {waist = "Dorin Obi"})
    sets.Obis.Water = set_combine(sets.Obis.AIO, {waist="Suirin Obi"})
    sets.Obis.Wind = set_combine(sets.Obis.AIO, {waist="Furin Obi"})
    sets.Obis.Ice = set_combine(sets.Obis.AIO, {waist="Hyorin Obi"})
    sets.Obis.Lightning = set_combine(sets.Obis.AIO, {waist="Rairin Obi"})
    sets.Obis.Light = set_combine(sets.Obis.AIO, {waist="Korin Obi"})
    sets.Obis.Dark = set_combine(sets.Obis.AIO, {waist="Anrin Obi"})
	sets.Obis.AIO = {waist = "Hachirin-no-Obi"}

	sets.JobAbility = {}
	sets.WeaponSkills = {}
	sets.WeaponSkills['Fotia'] = {
		neck = "Fotia Gorget",
		waist = "Fotia Belt"
	}

	sets.misc = {}
	sets.misc.Sandy = {body = "Kingdom Aketon"}
	sets.misc.Windy = {body = "Federation Aketon"}
	sets.misc.Bastok = {body = "Republic Aketon"}
	sets.misc.Gardening = {body = "Overalls"}

	sets.misc.AllJobsMAB = {
		left_ring="Acumen Ring",
		left_ear="Novio Earring",
		right_ear="Hecate's Earring",
		back="Izdubar Mantle",
		neck = "Stoicheion Medal"
	}
end