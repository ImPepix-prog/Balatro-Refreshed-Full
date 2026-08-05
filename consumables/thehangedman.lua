
SMODS.Consumable {
    key = 'thehangedman',
    set = 'Tarot',
    pos = { x = 1, y = 3 },
    loc_txt = {
        name = 'The Hanged Man?',
        text = {
            [1] = '{C:attention}Create{} 3',
            [2] = 'random {C:attention}Face{} cards'
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
        if G.hand and #G.hand.cards > 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 3 do
                        local faces = {}
                        for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                            local rank = SMODS.Ranks[rank_key]
                        if rank.face then table.insert(faces, rank) end
                        end
                        local _rank = pseudorandom_element(faces, 'add_face_cards').card_key
                        local _suit = nil
                        local new_card_params = { set = "Base" }
                    if _rank then new_card_params.rank = _rank end
                    if _suit then new_card_params.suit = _suit end
                        cards[i] = SMODS.add_card(new_card_params)
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
        end
    end,
    can_use = function(self, card)
        return (G.hand and #G.hand.cards > 0)
    end
}