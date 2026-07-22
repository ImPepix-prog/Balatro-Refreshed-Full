
SMODS.Consumable {
    key = 'elgorrito',
    set = 'loteria',
    pos = { x = 2, y = 1 },
    config = { 
        extra = {
            hands0_min = NaN,
            hands0_max = 3,
            discards0_min = NaN,
            discards0_max = 3   
        } 
    },
    loc_txt = {
        name = 'El gorrito',
        text = {
            [1] = '{C:blue}+1~3{} Hands and',
            [2] = '{C:red}+1~3{} Discards this round'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:1|3', 1, 3)).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + pseudorandom('RANGE:1|3', 1, 3)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:1|3', 1, 3)).." Discards", colour = G.C.GREEN})
                    
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + pseudorandom('RANGE:1|3', 1, 3)
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