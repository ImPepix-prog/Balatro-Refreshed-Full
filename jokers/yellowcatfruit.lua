
SMODS.Joker{ --Yellow Catfruit
    key = "yellowcatfruit",
    config = {
        extra = {
            FruitRemaining = 5
        }
    },
    loc_txt = {
        ['name'] = 'Yellow Catfruit',
        ['text'] = {
            [1] = 'Scored {C:diamonds}Diamonds{} gain {C:money}#1#${}',
            [2] = 'decreases by {C:attention}1{} when',
            [3] = 'a {C:attention}hand{} is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
            if context.other_card:is_suit("Diamonds") then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.FruitRemaining
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.FruitRemaining), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if to_big((card.ability.extra.FruitRemaining or 0)) <= to_big(0) then
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
            else
                card.ability.extra.FruitRemaining = math.max(0, (card.ability.extra.FruitRemaining) - 1)
            end
        end
    end
}