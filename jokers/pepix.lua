
SMODS.Joker{ --Pepix
    key = "pepix",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Pepix',
        ['text'] = {
            [1] = 'When Beating the {C:attention}Boss Blind{}',
            [2] = 'Create a Random {C:dark_edition}Negative{}',
            [3] = '{C:attention}Balatro Refrehed{} Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Refreshed_Refreshed_jokers' })
                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Refreshed!", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}