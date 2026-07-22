
SMODS.Consumable {
    key = 'rwheeloffortune',
    set = 'Tarot',
    pos = { x = 3, y = 3 },
    loc_txt = {
        name = 'Wheel of fortune?',
        text = {
            [1] = '{C:attention}Destroys 5 selected{}',
            [2] = 'cards and create',
            [3] = '{C:attention}5 random {C:enhanced}Enhanced{} {}cards'
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
        if to_big(#G.hand.highlighted) == to_big(5) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    SMODS.destroy_cards(G.hand.highlighted)
                    return true
                end
            }))
            delay(0.3)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 5 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local cen_pool = {}
                        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                                cen_pool[#cen_pool + 1] = enhancement_center
                            end
                        end
                        local enhancement = pseudorandom_element(cen_pool, 'add_cards_enhancement')
                        local new_card_params = { set = "Base" }
                    if _rank then new_card_params.rank = _rank end
                    if _suit then new_card_params.suit = _suit end
                    if enhancement then new_card_params.enhancement = enhancement.key end
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
        return (to_big(#G.hand.highlighted) == to_big(5))
    end
}