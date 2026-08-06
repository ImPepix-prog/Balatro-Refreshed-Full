
SMODS.Joker{ --Filibuster Obstructa
    key = "filibusterobstructa",
    config = {
        extra = {
            FilbusterRemaining = 6,
            xmult0 = 1000000
        }
    },
    loc_txt = {
        ['name'] = 'Filibuster Obstructa',
        ['text'] = {
            [1] = 'After playing {C:attention}#1# {}Hands',
            [2] = 'if it matches with the',
            [3] = '{C:attention}last hand of the round{}',
            [4] = '{X:mult,C:white}X1,000,000{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
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
        
        return {vars = {card.ability.extra.FilbusterRemaining}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  and not context.blueprint then
            if (to_big((card.ability.extra.FilbusterRemaining or 0)) <= to_big(1) and to_big(G.GAME.current_round.hands_left) ~= to_big(0)) then
                card.ability.extra.FilbusterRemaining = 6
            elseif (to_big((card.ability.extra.FilbusterRemaining or 0)) <= to_big(1) and to_big(G.GAME.current_round.hands_left) == to_big(0)) then
                card.ability.extra.FilbusterRemaining = 6
                return {
                    Xmult = 1000000
                }
            else
                card.ability.extra.FilbusterRemaining = math.max(0, (card.ability.extra.FilbusterRemaining) - 1)
            end
        end
    end
}