
SMODS.Consumable {
    key = 'thehermit',
    set = 'Tarot',
    pos = { x = 4, y = 3 },
    config = { 
        extra = {
            dollars0_min = NaN,
            dollars0_max = 23   
        } 
    },
    loc_txt = {
        name = 'The Hermit?',
        text = {
            [1] = '{C:money}+0~25${}'
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
                local target_dollars = G.GAME.dollars + pseudorandom('RANGE:0|23', 0, 23)
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:0|23', 0, 23)).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}