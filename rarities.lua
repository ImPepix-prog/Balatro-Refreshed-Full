SMODS.Rarity {
    key = "unique",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('fcf291'),
    loc_txt = {
        name = "Unique"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}