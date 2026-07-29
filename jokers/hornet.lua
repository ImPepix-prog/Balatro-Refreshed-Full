
SMODS.Joker{ --Hornet
    key = "hornet",
    config = {
        extra = {
            HornetXmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Hornet',
        ['text'] = {
            [1] = 'this joker gains {X:mult,C:white}X0.01{} Mult',
            [2] = 'for every discarted card',
            [3] = '{C:inactive}(Currrently {}{X:mult,C:white} X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.HornetXmult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.HornetXmult
            }
        end
        if context.discard  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.HornetXmult = (card.ability.extra.HornetXmult) + 0.01
                    return true
                end,
                message = "Upgrade!"
            }
        end
    end
}