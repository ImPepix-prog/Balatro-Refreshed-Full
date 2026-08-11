
SMODS.Joker{ --Spongy
    key = "spongy",
    config = {
        extra = {
            totalplayingcards = 1
        }
    },
    loc_txt = {
        ['name'] = 'Spongy',
        ['text'] = {
            [1] = 'this joker gains {X:mult,C:white}X0.05{} Mult',
            [2] = 'for every card of your full deck',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.totalplayingcards + (#(G.playing_cards or {})) * 0.05}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.totalplayingcards + (#(G.playing_cards or {})) * 0.05
            }
        end
    end
}