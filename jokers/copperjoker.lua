
SMODS.Joker{ --Copper Joker
    key = "copperjoker",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Copper Joker',
        ['text'] = {
            [1] = 'Held in hand cards have a {C:green}#1# in #2# {}chance',
            [2] = 'of becoming {C:enhanced}Copper cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_copperjoker') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8c9db603', 1, card.ability.extra.odds, 'j_Refreshed_copperjoker', false) then
                    SMODS.calculate_effect({func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_Refreshed_copper)
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Upgraded!", colour = G.C.BLUE})
                end
            end
        end
    end
}