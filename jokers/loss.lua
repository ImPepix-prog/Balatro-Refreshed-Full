
SMODS.Joker{ --Loss
    key = "loss",
    config = {
        extra = {
            LossMult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Loss',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+3{} Mult',
            [2] = 'when a card is destroyed',
            [3] = '{C:inactive}(Currently{}{C:red} +#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
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
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.LossMult}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.LossMult = (card.ability.extra.LossMult) + 3
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.LossMult
            }
        end
    end
}