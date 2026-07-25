
SMODS.Joker{ --Red Catfruit
    key = "redcatfruit",
    config = {
        extra = {
            FruitRemaining = 25,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Red Catfruit',
        ['text'] = {
            [1] = 'Scored {C:hearts}Hearts{} give',
            [2] = '{X:mult,C:white}x1.5{} Mult, destroys after',
            [3] = 'scoring {C:attention}#1# {}cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FruitRemaining}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
                return {
                    Xmult = 1.5
                }
            else
                card.ability.extra.FruitRemaining = math.max(0, (card.ability.extra.FruitRemaining) - 1)
            end
        end
        if context.after and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.FruitRemaining or 0)) <= to_big(0) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Consumed!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}