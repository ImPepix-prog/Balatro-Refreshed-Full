
SMODS.Joker{ --Machine Love
    key = "machinelove",
    config = {
        extra = {
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Machine Love',
        ['text'] = {
            [1] = 'Played {C:hearts}Heart{} suit face',
            [2] = 'cards give {X:mult,C:white}X2{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_face() and context.other_card:is_suit("Hearts")) then
                return {
                    Xmult = 2
                }
            end
        end
    end
}