
SMODS.Joker{ --Open Utau
    key = "openutau",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Open Utau',
        ['text'] = {
            [1] = 'At the start of the {C:attention}Round{}',
            [2] = 'create a random {C:attention}Vocaloid Joker{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Refreshed_Vocaloid' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Creating song!", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}