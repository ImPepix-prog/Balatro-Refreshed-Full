
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
            [2] = '{C:red}+3{} Mult if played hand',
            [3] = 'only contains {C:attention}#2#s{}',
            [4] = '{C:inactive}(Suit changes at the end of the round){}',
            [5] = '{C:inactive}(Currently{} {C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.LoveMult, localize((G.GAME.current_round.LoveSuit_card or {}).suit or 'Spades', 'suits_singular')}, colours = {G.C.SUITS[(G.GAME.current_round.LoveSuit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.LoveSuit_card = { suit = 'Hearts' }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.LoveMult
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if G.playing_cards then
                local valid_LoveSuit_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_LoveSuit_cards[#valid_LoveSuit_cards + 1] = v
                    end
                end
                if valid_LoveSuit_cards[1] then
                    local LoveSuit_card = pseudorandom_element(valid_LoveSuit_cards, pseudoseed('LoveSuit' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.LoveSuit_card.suit = LoveSuit_card.base.suit
                end
            end
        end
        if context.before and context.cardarea == G.jokers  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.LoveSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count == #context.full_hand
            end)() then
                return {
                    func = function()
                        card.ability.extra.LoveMult = (card.ability.extra.LoveMult) + 3
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
    end
}