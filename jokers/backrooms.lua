
SMODS.Joker{ --Backrooms
    key = "backrooms",
    config = {
        extra = {
            odds = 10,
            odds2 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Backrooms',
        ['text'] = {
            [1] = 'Played {C:attention}Face{} cards',
            [2] = 'have a fixed {C:green}#1# in #2# {} Chance',
            [3] = 'of becoming {C:dark_edition}Negative{}',
            [4] = '{C:green}{}{C:green}#1# in #2# {}Chance of',
            [5] = 'being {C:red}Destroyed{} at the',
            [6] = 'end of the {C:attention}Round{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_backrooms')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_Refreshed_backrooms')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_caec2ded', 1, card.ability.extra.odds, 'j_Refreshed_backrooms', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_edition("e_negative", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Upgrade!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_cc3bbad2', 1, card.ability.extra.odds, 'j_Refreshed_backrooms', false) then
                    SMODS.calculate_effect({func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Nocliped!", colour = G.C.RED})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}