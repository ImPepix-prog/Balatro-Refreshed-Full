
SMODS.Joker{ --Toilet
    key = "toilet",
    config = {
        extra = {
            ToiletXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Toilet',
        ['text'] = {
            [1] = 'this joker gains {X:mult,C:white}X0.2{} Mult',
            [2] = 'for every played hand containing a {C:attention}flush{}',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
        
        return {vars = {card.ability.extra.ToiletXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if next(context.poker_hands["Flush"]) then
                return {
                    func = function()
                        card.ability.extra.ToiletXMult = (card.ability.extra.ToiletXMult) + 0.2
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.ToiletXMult
            }
        end
    end
}