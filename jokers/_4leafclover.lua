
SMODS.Joker{ --4 Leaf Clover
    key = "_4leafclover",
    config = {
        extra = {
            CloverRemaining = 15,
            set_probability0 = 1
        }
    },
    loc_txt = {
        ['name'] = '4 Leaf Clover',
        ['text'] = {
            [1] = '{C:green}Probability based effects{}',
            [2] = 'always happend',
            [3] = '{C:inactive}(Destroys after {}{C:red}#1# {}{C:inactive}Discards){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CloverRemaining}}
    end,
    
    calculate = function(self, card, context)
        if context.fix_probability and not context.blueprint then
            local numerator, denominator = context.numerator, context.denominator
            denominator = 1
            return {
                numerator = numerator, 
                denominator = denominator
            }
        end
        if context.pre_discard  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.CloverRemaining = math.max(0, (card.ability.extra.CloverRemaining) - 1)
                    return true
                end,
                message = "-1"
            }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.CloverRemaining or 0)) <= to_big(0) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}