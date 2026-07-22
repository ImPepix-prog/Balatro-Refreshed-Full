
SMODS.Joker{ --Megumi Nakajima
    key = "meguminakajima",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Megumi Nakajima',
        ['text'] = {
            [1] = 'When beating the {C:attention}Boss Blind{}',
            [2] = 'create a {C:attention}Random{} {C:dark_edition}Negative{}',
            [3] = '{C:attention}Perishable Vocaloid Legendary{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_TrueVocaloid"] = true, ["Refreshed_LegeVocaloid"] = true },
    soul_pos = {
        x = 9,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Refreshed_LegeVocaloid' })
                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                                joker_card:add_sticker('perishable', true)
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied!", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}