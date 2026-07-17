
SMODS.Joker{ --Jackpot
    key = "jackpot",
    config = {
        extra = {
            odds = 7,
            xmult0 = 7
        }
    },
    loc_txt = {
        ['name'] = 'Jackpot',
        ['text'] = {
            [1] = 'Played {C:attention}7s{} have a {C:green}#1# in #2# {}',
            [2] = 'chance of giving {X:red,C:white}X7{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_jackpot') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 7 then
                if SMODS.pseudorandom_probability(card, 'group_0_91e852e3', 1, card.ability.extra.odds, 'j_Refreshed_jackpot', false) then
                    SMODS.calculate_effect({Xmult = 7}, card)
                end
            end
        end
    end
}