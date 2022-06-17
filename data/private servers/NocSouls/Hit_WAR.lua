include("organizer-lib")
include("includes/common-functions")
include("includes/config")

function get_sets()

    sets.precast = {}
    sets.precast['Fast Cast'] = {
        left_ring = "Hermit's Ring",
		right_ring = "Hermit's Ring",
		neck="Silver Name Tag",
		head="Cache-Nez"
    }
    sets.precast['WS']= {
        head="Pummelers Mask +1",
        neck="Loricate Torque +1",
        left_ear="Moonshade Earring",
        right_ear="Stamina Earring +1",
        body="Pummeler's Lorica +1",
        hands="Pummeler's Mufflers +1",
        left_ring="Rajas Ring",
        right_ring="Castor's Ring",
        back="Annealed Mantle",
        waist="Paewr Belt",
        legs="Pummeler's Cuisses +1",
        feet="Pummeler's Calligae +1"
    }
    sets.aftercast = {}
    sets.aftercast['TP'] = {
        head="Dux Visor",
        neck="Loricate Torque +1",
        left_ear="Moonshade Earring",
        right_ear="Stamina Earring +1",
        body="Dux Scale Mail",
        hands="Dux Finger Gauntlets",
        left_ring="Rajas Ring",
        right_ring="Castor's Ring",
        back="Annealed Mantle",
        waist="Paewr Belt",
        legs="Dux Cuisses",
        feet="Dux Greaves"
    }
end

function precast(spell)
    equip(sets.precast['WS'])

    if spell.action_type == "Magic" then
		equip(sets.precast['Fast Cast'])    
	end
end

function aftercast(spell)
    equip(sets.aftercast['TP'])
end

function status_change(new, old)
    equip(sets.aftercast['TP'])
end