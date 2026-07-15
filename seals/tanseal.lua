
SMODS.Seal {
    key = 'tanseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            freeconsumableslots = 0,
            consumableslots = 0
        }
    },
    badge_colour = HEX('EE82EE'),
    loc_txt = {
        name = 'Tan seal',
        label = 'Tan seal',
        text = {
            [1] = 'When {C:attention}held in hand{}',
            [2] = 'creates a random {C:purple}Loteria{} card'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {(((G.consumeables and G.consumeables.config.card_limit or 0) - #(G.consumeables and G.consumeables.cards or {})) or 0), (G.consumeables and G.consumeables.config.card_limit or 0 or 0)}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring and to_big(((G.consumeables and G.consumeables.config.card_limit or 0) - #(G.consumeables and G.consumeables.cards or {}))) < to_big(G.consumeables and G.consumeables.config.card_limit or 0) then
            return {
                
                func = function()
                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'loteria', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}