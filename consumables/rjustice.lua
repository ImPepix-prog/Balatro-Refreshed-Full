
SMODS.Consumable {
    key = 'rjustice',
    set = 'Tarot',
    pos = { x = 3, y = 2 },
    config = { 
        extra = {
            dollars0 = 0   
        } 
    },
    loc_txt = {
        name = 'Justice?',
        text = {
            [1] = 'Create a random {C:dark_edition}Negative{}',
            [2] = 'Joker and set {C:money}Money{}',
            [3] = 'to {C:attention}0{}'
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
                play_sound('timpani')
                local new_joker = SMODS.add_card({ set = 'Joker' })
                if new_joker then
                    new_joker:set_edition("e_negative", true)
                end
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = 0
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(0).." $", colour = G.C.RED})
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