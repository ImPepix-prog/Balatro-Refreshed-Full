
SMODS.Back {
    key = 'teto_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Teto Deck',
        text = {
            [1] = 'Start with a random {C:attention}Eternal{} {C:red}Teto Joker{}',
            [2] = '{C:attention}+1{} Joker Slot'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Refreshed_teto_joker' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
    end
}