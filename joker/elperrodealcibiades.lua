
SMODS.Joker{ --El Perro de Alcibiades
    key = "elperrodealcibiades",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'El Perro de Alcibiades',
        ['text'] = {
            [1] = '{C:attention}Held in hand Face{} cards',
            [2] = 'become {C:attention}Stone{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 8
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_face() then
                return {
                    func = function()
                        context.other_card:set_ability(G.P_CENTERS.m_stone)
                    end,
                    message = "Upgraded!"
                }
            end
        end
    end
}