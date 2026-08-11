
SMODS.Joker{ --Smots Gaming
    key = "smotsgaming",
    config = {
        extra = {
            blind_size0 = 2,
            blind_size02 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Smots Gaming',
        ['text'] = {
            [1] = 'If played hand {C:attention}contains{} an {C:attention}8{}',
            [2] = 'halve the {C:attention}blind requirement{}',
            [3] = 'If it {C:attention}contains{} a {C:attention}5{}',
            [4] = '{C:attention}double it{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 9
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
    soul_pos = {
        x = 2,
        y = 9
    },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 8 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and not ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 5 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)())) then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Smots Gaming!", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips / 2
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            elseif (not ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 8 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 5 then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                return {
                    
                    func = function()
                        if G.GAME.blind.in_blind then
                            
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Sorry everyone! ):", colour = G.C.GREEN})
                            G.GAME.blind.chips = G.GAME.blind.chips * 2
                            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            G.HUD_blind:recalculate()
                            return true
                        end
                    end
                }
            end
        end
    end
}