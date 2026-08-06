
SMODS.Joker{ --The Noise
    key = "thenoise",
    config = {
        extra = {
            xmult0 = 1.5,
            xmult = 2,
            xmult2 = 2.5,
            xmult3 = 3
        }
    },
    loc_txt = {
        ['name'] = 'The Noise',
        ['text'] = {
            [1] = 'Its {E:1}The Noise{}',
            [2] = '{C:inactive}(No ability Yet :p){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "Refreshed_unique",
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
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'uta' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((#context.full_hand - #context.scoring_hand)) == to_big(1) then
                return {
                    Xmult = 1.5
                }
            elseif to_big((#context.full_hand - #context.scoring_hand)) == to_big(2) then
                return {
                    Xmult = 2
                }
            elseif to_big((#context.full_hand - #context.scoring_hand)) == to_big(3) then
                return {
                    Xmult = 2.5
                }
            elseif to_big((#context.full_hand - #context.scoring_hand)) == to_big(4) then
                return {
                    Xmult = 3
                }
            end
        end
    end
}