
SMODS.Joker{ --Coffee
    key = "coffee",
    config = {
        extra = {
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Coffee',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult, {C:attention}destroys{} if',
            [2] = 'played hand doesnt',
            [3] = 'win the blind'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "Refreshed_unique",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Drink"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'uta' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 3
            }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if not (G.GAME.current_round.hands_played == 0) then
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Dranked!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}