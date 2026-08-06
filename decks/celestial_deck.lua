
SMODS.Back {
    key = 'celestial_deck',
    pos = { x = 3, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Celestial Deck',
        text = {
            [1] = 'Create a {C:planet}Planet{} card',
            [2] = 'when {C:attention}Blind{} is selected',
            [3] = '{C:inactive}(Must have room){}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', 
                        })
                        return true
                    end
                }))
            end
        end
    end,
    
}