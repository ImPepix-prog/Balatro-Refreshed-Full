
SMODS.Consumable {
    key = 'rtheemperor',
    set = 'Tarot',
    pos = { x = 9, y = 3 },
    config = { 
        extra = {
            dollars0 = 5   
        } 
    },
    loc_txt = {
        name = 'The Emperor',
        text = {
            [1] = 'lose {C:money}5${} and create',
            [2] = 'a random {C:dark_edition}Negative{} {C:tarot}tarot{} card'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars - 5
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(5).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    end
                    
                    
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Tarot', edition = 'e_negative', })                            
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
        
        if created_consumable then
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
        end
        return true
    end,
    can_use = function(self, card)
        return true
    end
}