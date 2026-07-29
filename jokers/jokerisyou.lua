
SMODS.Joker{ --Joker is You
    key = "jokerisyou",
    config = {
        extra = {
            JokerIsYouMult = 0,
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Joker is You',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+1{} Mult',
            [2] = 'if played hand {C:attention}contains{}',
            [3] = 'same quantity of cards',
            [4] = 'as your {C:attention}Owned Jokers{}',
            [5] = '{C:inactive}(Currently {}{C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JokerIsYouMult, #(G.jokers and (G.jokers and G.jokers.cards or {}) or {})}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.JokerIsYouMult
            }
        end
        if context.before and context.cardarea == G.jokers  then
            if to_big(#context.full_hand) == to_big(#(G.jokers and G.jokers.cards or {})) then
                return {
                    func = function()
                        card.ability.extra.JokerIsYouMult = (card.ability.extra.JokerIsYouMult) + 1
                        return true
                    end,
                    message = "Upgrade!"
                }
            elseif (to_big(#(G.jokers and G.jokers.cards or {})) >= to_big(6)) and (to_big(#context.full_hand) >= to_big(5)) then
                return {
                    func = function()
                        card.ability.extra.JokerIsYouMult = (card.ability.extra.JokerIsYouMult) + 1
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
    end
}