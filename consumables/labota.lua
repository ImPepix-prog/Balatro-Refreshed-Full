
SMODS.Consumable {
    key = 'labota',
    set = 'loteria',
    pos = { x = 1, y = 1 },
    config = { 
        extra = {
            discards0 = 3   
        } 
    },
    loc_txt = {
        name = 'La Bota',
        text = {
            [1] = '{C:red}+3{} Discards for this round'
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
        if G.GAME.blind.in_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Discards", colour = G.C.GREEN})
                    
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 3
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (G.GAME.blind.in_blind)
    end
}