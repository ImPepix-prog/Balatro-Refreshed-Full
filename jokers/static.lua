
SMODS.Joker{ --Static
    key = "static",
    config = {
        extra = {
            StaticMult = 0,
            Discarted = 0
        }
    },
    loc_txt = {
        ['name'] = 'Static',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+2{} Mult',
            [2] = 'for every played hand',
            [3] = 'without {C:red}discarting{} This {C:attention}Round{}',
            [4] = '{C:inactive}(Currently{}{C:red} +#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.StaticMult, card.ability.extra.Discarted}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.StaticMult
            }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.Discarted or 0)) == to_big(0) then
                return {
                    func = function()
                        card.ability.extra.StaticMult = (card.ability.extra.StaticMult) + 2
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.discard  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.Discarted = 1
                    return true
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.Discarted = 0
                    return true
                end
            }
        end
    end
}