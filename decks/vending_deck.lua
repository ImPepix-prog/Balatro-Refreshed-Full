
SMODS.Back {
    key = 'vending_deck',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            freejokerslots = 0
        },
    },
    loc_txt = {
        name = 'Vending Deck',
        text = {
            [1] = 'When entering a {C:attention}blind{}',
            [2] = '{C:attention}Creates{} a {C:attention}Drink{} Joker'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            if to_big(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))) >= to_big(1) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('timpani')
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            local new_joker = SMODS.add_card({ set = 'Refreshed_Drink' })
                            if new_joker then
                            end
                            G.GAME.joker_buffer = 0
                        end
                        return true
                    end
                }))
            end
        end
    end,
    
}