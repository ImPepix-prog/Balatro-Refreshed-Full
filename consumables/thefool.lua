
SMODS.Consumable {
    key = 'thefool',
    set = 'Tarot',
    pos = { x = 3, y = 4 },
    loc_txt = {
        name = 'The fool',
        text = {
            [1] = 'Create {C:attention}2{} random',
            [2] = '{C:attention}Consumables{}'
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
        for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    
                    play_sound('timpani')
                    local sets = {'Tarot', 'Planet', 'Spectral'}
                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                    SMODS.add_card({ set = random_set, })                            
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
        
        if created_consumable then
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
        end
        return true
    end,
    can_use = function(self, card)
        return true
    end
}