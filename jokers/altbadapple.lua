
SMODS.Joker{ --Bad Apple
    key = "altbadapple",
    config = {
        extra = {
            chips0 = 60
        }
    },
    loc_txt = {
        ['name'] = 'Bad Apple',
        ['text'] = {
            [1] = '{C:attention}Held in hand {}{C:clubs}Clubs{} and',
            [2] = '{C:spades}Spades{} Gives {C:blue}+60{} Chips',
            [3] = '{C:inactive}(Changes at the end of the round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'uta' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                return {
                    chips = 60
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    local target_joker = card
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        
                        local created_joker = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_Refreshed_badapple' })
                                if joker_card then
                                    
                                    
                                end
                                
                                return true
                            end
                        }))
                        
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Change!", colour = G.C.BLUE})
                        end
                        return true
                    end,
                    colour = G.C.BLUE
                }
            }
        end
    end
}