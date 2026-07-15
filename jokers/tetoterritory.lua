
SMODS.Joker{ --Teto Territory
    key = "tetoterritory",
    config = {
        extra = {
            chips0 = 31
        }
    },
    loc_txt = {
        ['name'] = 'Teto Territory',
        ['text'] = {
            [1] = 'Scored {C:attention}Queens{}',
            [2] = 'give {C:blue}+31{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 12 then
                return {
                    chips = 31
                }
            end
        end
    end
}