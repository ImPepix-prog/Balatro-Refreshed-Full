
SMODS.Back {
    key = 'white_deck',
    pos = { x = 5, y = 0 },
    config = {
        extra = {
            play_size0 = 1,
            discard_size0 = 1,
            play_size = 1,
            discard_size = 1,
            play_size2 = 1,
            discard_size2 = 1
        },
    },
    loc_txt = {
        name = 'White Deck',
        text = {
            [1] = '{C:blue}+1{} Hand',
            [2] = '{C:attention}+1{} Joker slot',
            [3] = '{C:attention}-1{} Selection Limit'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.setting_blind then
            if (G.GAME.blind.boss and to_big(G.GAME.blind.config.blind.key) == to_big("bl_psychic")) then
                return {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            
                            SMODS.change_play_limit(1)
                            return true
                        end
                    })),
                    extra = {
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                
                                
                                SMODS.change_discard_limit(1)
                                return true
                            end
                        })),
                        colour = G.C.WHITE
                    }
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if to_big(G.GAME.blind.config.blind.key) == to_big("bl_psychic") then
                return {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            
                            SMODS.change_play_limit(-1)
                            return true
                        end
                    })),
                    extra = {
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                
                                
                                SMODS.change_discard_limit(-1)
                                return true
                            end
                        })),
                        colour = G.C.WHITE
                    }
                }
            end
        end
    end,
    apply = function(self, back)
        G.GAME.starting_params.hands = G.GAME.starting_params.hands + 1
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_play_limit(-1)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        SMODS.change_discard_limit(-1)
                        return true
                    end
                })),
                colour = G.C.WHITE
            }
        }
    end
}