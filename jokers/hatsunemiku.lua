
SMODS.Joker{ --Hatsune Miku
    key = "hatsunemiku",
    config = {
        extra = {
            repetitions0_min = NaN,
            repetitions0_max = 5
        }
    },
    loc_txt = {
        ['name'] = 'Hatsune Miku',
        ['text'] = {
            [1] = 'all played cards {C:attention}retrigger{} {C:green}1~5{} additional times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_RealVocaloid"] = true, ["Refreshed_LegeVocaloid"] = true },
    soul_pos = {
        x = 3,
        y = 5
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            return {
                repetitions = pseudorandom('RANGE:1|5', 1, 5),
                message = localize('k_again_ex')
            }
        end
    end
}