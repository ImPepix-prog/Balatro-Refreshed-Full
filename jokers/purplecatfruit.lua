
SMODS.Joker{ --Purple Catfruit
    key = "purplecatfruit",
    config = {
        extra = {
            FruitRemaining = 3,
            chips0 = 60
        }
    },
    loc_txt = {
        ['name'] = 'Purple Catfruit',
        ['text'] = {
            [1] = 'Scored {C:spades}Spades{}',
            [2] = 'give {C:blue}+60{} Chips Consumes',
            [3] = 'after {C:attention}#1# {}rounds'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
                    chips = 60
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if to_big((card.ability.extra.FruitRemaining or 0)) <= to_big(1) then
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
            else
                return {
                    func = function()
                        card.ability.extra.FruitRemaining = math.max(0, (card.ability.extra.FruitRemaining) - 1)
                        return true
                    end
                }
            end
        end
    end
}