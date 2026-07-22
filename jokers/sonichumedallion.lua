
SMODS.Joker{ --Sonichu Medallion
    key = "sonichumedallion",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Sonichu Medallion',
        ['text'] = {
            [1] = '{C:attention}Transoform{} all {C:attention}scored{}',
            [2] = 'cards into {C:attention}Bootleg{} cards',
            [3] = 'scored {C:attention}Bootleg{} cards give',
            [4] = '{X:mult,C:white}x1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_Refreshed_bootleg"] == true then
                return {
                    Xmult = 1.5
                }
            else
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.m_Refreshed_bootleg)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}