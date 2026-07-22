
SMODS.Joker{ --Pink Slip
    key = "pinkslip",
    config = {
        extra = {
            dollars0 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Pink Slip',
        ['text'] = {
            [1] = 'When a {C:attention}Face{} card is',
            [2] = '{C:attention}Destroyed{} gain {C:money}6${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  and not context.blueprint then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 6
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(6), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}