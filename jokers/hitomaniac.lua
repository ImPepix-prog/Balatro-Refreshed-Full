
SMODS.Joker{ --Hito maniac
    key = "hitomaniac",
    config = {
        extra = {
            repetitions0_min = NaN,
            repetitions0_max = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hito maniac',
        ['text'] = {
            [1] = 'Retrigger played {C:attention}Face{} cards',
            [2] = '{C:green}1~2{} additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    repetitions = pseudorandom('RANGE:1|2', 1, 2),
                    message = localize('k_again_ex')
                }
            end
        end
    end
}