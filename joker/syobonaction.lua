
SMODS.Joker{ --Syobon Action
    key = "syobonaction",
    config = {
        extra = {
            SyobonActionMult = 1,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Syobon Action',
        ['text'] = {
            [1] = 'scored cards give {C:red}+#1# {}Mult',
            [2] = 'gains {C:red}1{} Mult when {C:attention}hand finishes scoring{}',
            [3] = '{C:green}#2# in #3# {}chance to reset at the',
            [4] = '{C:attention}end of the round{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_syobonaction') 
        return {vars = {card.ability.extra.SyobonActionMult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                mult = card.ability.extra.SyobonActionMult
            }
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.SyobonActionMult = (card.ability.extra.SyobonActionMult) + 1
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_aae1e2cc', 1, card.ability.extra.odds, 'j_Refreshed_syobonaction', false) then
                    SMODS.calculate_effect({func = function()
                        card.ability.extra.SyobonActionMult = 1
                        return true
                    end}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Reset!", colour = G.C.BLUE})
                end
            end
        end
    end
}