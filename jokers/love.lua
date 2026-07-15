
SMODS.Joker{ --Love
    key = "love",
    config = {
        extra = {
            LoveMult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Love',
        ['text'] = {
            [1] = 'This {C:attention}Joker{} gains',
            [2] = '{C:red}+5{} Mult if played hand',
            [3] = 'only contains {C:attention}#2#s{}',
            [4] = '{C:inactive}(Suit changes between red suits',
                [5] = 'at the end of the round, Currently{}',
            [6] = '{C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
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
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Joker',
    pools = { ["modprefix_Refreshed_jokers"] = true, ["modprefix_Vocaloid"] = true, ["modprefix_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.LoveMult, localize((G.GAME.current_round.LoveSuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.LoveSuit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.LoveSuit_card = { suit = 'Hearts' }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.LoveSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count == #context.full_hand
            end)() then
                card.ability.extra.LoveMult = (card.ability.extra.LoveMult) + 5
                return {
                    message = "Upgrade!"
                }
            else
                return {
                    mult = card.ability.extra.LoveMult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            local suit_pool = {Hearts,Diamonds}
            G.GAME.current_round.LoveSuit_card.suit = pseudorandom_element(suit_pool, pseudoseed('randomSuit'))
        end
    end
}