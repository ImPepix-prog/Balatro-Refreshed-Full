
SMODS.Joker{ --Lazy joker
    key = "lazyjoker",
    config = {
        extra = {
            mult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Lazy joker',
        ['text'] = {
            [1] = 'all scoring card gives {C:red}+2 {}Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                mult = 2
            }
        end
    end
}