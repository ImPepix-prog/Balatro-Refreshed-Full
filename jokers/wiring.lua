
SMODS.Joker{ --Wiring
    key = "wiring",
    config = {
        extra = {
            mult0 = 8,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Wiring',
        ['text'] = {
            [1] = 'When a {C:enhanced}Copper{} card {C:red}+Mult{} is triggered {X:mult,C:white}X1.5{} Mult',
            [2] = 'When a {C:enhanced}Steel{} card {X:mult,C:white}XMult{} is triggered {C:red}+8{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
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
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    mult = 8
                }
            elseif SMODS.get_enhancements(context.other_card)["m_Refreshed_copper"] == true then
                return {
                    Xmult = 1.5
                }
            end
        end
    end
}