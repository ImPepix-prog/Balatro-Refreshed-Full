
SMODS.Back {
    key = 'that_one_deck_everyone_hates_playing_with',
    pos = { x = 4, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'That One Deck Everyone Hates Playing With',
        text = {
            [1] = '{C:red}-1{} Hand',
            [2] = '{C:dark_edition}+1{} Joker slot',
            [3] = 'Start with a eternal',
            [4] = '{C:attention}Owata Action Online{}'
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
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_Refreshed_owataactiononline' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
    end
}