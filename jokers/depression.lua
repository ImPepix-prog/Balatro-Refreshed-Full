
SMODS.Joker{ --Depression
    key = "depression",
    config = {
        extra = {
            BaumkuchenEndCreditsMult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Depression',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+1{} Mult',
            [2] = 'for every discarted {C:hearts}Heart{} card.',
            [3] = 'Resets if other {C:attention}Suit{} is discarted',
            [4] = '{C:inactive}(Currently {}{C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 4
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.BaumkuchenEndCreditsMult}}
    end,
    
    calculate = function(self, card, context)
        if context.discard  then
            if context.other_card:is_suit("Hearts") then
                return {
                    func = function()
                        card.ability.extra.BaumkuchenEndCreditsMult = (card.ability.extra.BaumkuchenEndCreditsMult) + 1
                        return true
                    end,
                    message = "Upgrade!"
                }
            elseif not (context.other_card:is_suit("Hearts")) then
                return {
                    func = function()
                        card.ability.extra.BaumkuchenEndCreditsMult = 0
                        return true
                    end,
                    message = "Reset!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.BaumkuchenEndCreditsMult
            }
        end
    end
}