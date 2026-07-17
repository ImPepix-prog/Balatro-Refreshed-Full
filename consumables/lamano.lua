
SMODS.Consumable {
    key = 'lamano',
    set = 'loteria',
    pos = { x = 0, y = 1 },
    config = { 
        extra = {
            hands0 = 3   
        } 
    },
    loc_txt = {
        name = 'La Mano',
        text = {
            [1] = '{C:blue}+3{} Hands for this round'
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
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(3).." Hands", colour = G.C.GREEN})
                
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 3
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}