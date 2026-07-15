
SMODS.Joker{ --rekoJ
    key = "rekoj",
    config = {
        extra = {
            cardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'rekoJ',
        ['text'] = {
            [1] = '{C:red}+0.5{} Mult for every',
            [2] = 'remaining card in the deck',
            [3] = '{C:inactive}(Currently{}{C:red} +#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {((#(G.deck and G.deck.cards or {}) or 0)) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = (#(G.deck and G.deck.cards or {})) * 0.5
            }
        end
    end
}