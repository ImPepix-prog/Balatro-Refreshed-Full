
SMODS.Joker{ --Kasane Teto
    key = "kasaneteto",
    config = {
        extra = {
            xmult0 = 1.5,
            dollars0 = 3,
            xmult = 1.5,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Kasane Teto',
        ['text'] = {
            [1] = 'when playing a hand transforms all',
            [2] = 'held in hand cards into {C:attention}Gold{} cards',
            [3] = 'held in hand or played {C:attention}Gold{} cards give',
            [4] = '{X:red,C:white}X1.5{} Mult and {C:money}3${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_RealVocaloid"] = true, ["Refreshed_LegeVocaloid"] = true },
    soul_pos = {
        x = 3,
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    Xmult = 1.5,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 3
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            else
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_gold)
                    end,
                    message = "Upgraded!"
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    Xmult = 1.5,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 3
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(3), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            end
        end
    end
}