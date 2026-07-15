
SMODS.Joker{ --Divorce Papers
    key = "divorcepapers",
    config = {
        extra = {
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Divorce Papers',
        ['text'] = {
            [1] = 'If first played hand of the {C:attention}Round{}',
            [2] = 'only contains {C:attention}King{} or a {C:attention}Queen{}',
            [3] = 'destroy it and gain {C:money}5${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if ((to_big(#context.full_hand) == to_big(1) and G.GAME.current_round.hands_played == 0)) and ((context.other_card:get_id() == 12 or context.other_card:get_id() == 13)) then
                context.other_card.should_destroy = true
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 5
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                        return true
                    end,
                    extra = {
                        message = "Divorced!",
                        colour = G.C.RED
                    }
                }
            end
        end
    end
}