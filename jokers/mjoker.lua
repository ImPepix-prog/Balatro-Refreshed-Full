
SMODS.Joker{ --M Joker
    key = "mjoker",
    config = {
        extra = {
            MJokerMult = 0,
            MJokerChips = 0,
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'M Joker',
        ['text'] = {
            [1] = 'If played poker hand contains a {C:attention}pair{}',
            [2] = '{C:attention}level up pair by 1 level{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MJokerMult, card.ability.extra.MJokerChips}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Pair"]) then
                local target_hand = "Pair"
                level_up_hand(card, target_hand, true, 1)
                return {
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}