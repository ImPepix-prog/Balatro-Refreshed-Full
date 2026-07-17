
SMODS.Joker{ --Akage
    key = "akage",
    config = {
        extra = {
            repetitions0_min = NaN,
            repetitions0_max = 4
        }
    },
    loc_txt = {
        ['name'] = 'Akage',
        ['text'] = {
            [1] = 'Scored {C:hearts}Heart{} suit cards',
            [2] = 'are {C:attention}Retriggered{} {C:green}0~4{} extra times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                return {
                    repetitions = pseudorandom('RANGE:0|4', 0, 4),
                    message = localize('k_again_ex')
                }
            end
        end
    end
}