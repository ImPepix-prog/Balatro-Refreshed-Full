
SMODS.Consumable {
    key = 'elvaliente',
    set = 'loteria',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'El Valiente',
        text = {
            [1] = 'Disables the current {C:attention}Boss blind{}'
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
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.blind:disable()
                    play_sound('timpani')
                    return true
                end
            }))
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Disabled!", colour = G.C.GREEN})
        end
    end,
    can_use = function(self, card)
        return true
    end
}