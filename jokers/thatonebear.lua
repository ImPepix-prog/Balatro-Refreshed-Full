
SMODS.Joker{ --That One Bear
    key = "thatonebear",
    config = {
        extra = {
            lowestrankinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'That One Bear',
        ['text'] = {
            [1] = 'This Joker gives {C:attention}1/4{}',
            [2] = 'of the {C:attention}lowest{} card',
            [3] = '{C:attention}rank{} as {X:mult,C:white}Xmult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {((function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)() or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
        if (to_big((function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)()) ~= to_big(2) and to_big((function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)()) ~= to_big(3)) then
            return {
            Xmult = ((function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)()) * 0.25
            }
        end
    end
end
}