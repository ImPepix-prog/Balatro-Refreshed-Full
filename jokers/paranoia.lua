
SMODS.Joker{ --Paranoia
    key = "paranoia",
    config = {
        extra = {
            mod_probability0 = 1000000
        }
    },
    loc_txt = {
        ['name'] = 'Paranoia',
        ['text'] = {
            [1] = '{C:green}Probability based effects{}',
            [2] = 'have a {C:attention}Very low chance{} of happening'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            denominator = denominator + (1000000)
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
    end
}