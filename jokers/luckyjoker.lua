
SMODS.Joker{ --Lucky Joker
    key = "luckyjoker",
    config = {
        extra = {
            LuckyJokerXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Lucky Joker',
        ['text'] = {
            [1] = 'This Joker Gains {X:mult,C:white}X0.2{} Mult for every',
            [2] = 'succesful probability result',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.LuckyJokerXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.pseudorandom_result  and not context.blueprint then
            if context.result then
                return {
                    func = function()
                        card.ability.extra.LuckyJokerXMult = (card.ability.extra.LuckyJokerXMult) + 0.2
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.LuckyJokerXMult
            }
        end
    end
}