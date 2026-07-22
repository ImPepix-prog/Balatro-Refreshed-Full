
SMODS.Joker{ --Spoken for
    key = "spokenfor",
    config = {
        extra = {
            xmult0 = 3,
            xmult = 0.75,
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Spoken for',
        ['text'] = {
            [1] = '{X:mult,C:white}X3{} Mult if played hand',
            [2] = 'doesnt contain a {C:attention}Face{} card',
            [3] = 'otherwise {X:mult,C:white}X0.75{} Mult and {C:money}+5${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count == 0
            end)() then
                return {
                    Xmult = 3
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() then
                return {
                    Xmult = 0.75,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 5
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}