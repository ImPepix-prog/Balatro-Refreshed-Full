
SMODS.Joker{ --Static
    key = "static",
    config = {
        extra = {
            StaticMult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Static',
        ['text'] = {
            [1] = 'When a hand is played this Joker gains {C:red}+3{} Mult',
            [2] = 'when a hand is discarted this Joker losses {C:red}-1{} Mult',
            [3] = '{C:inactive}(Currrently {}{C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.StaticMult}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.StaticMult = (card.ability.extra.StaticMult) + 3
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.pre_discard  then
            return {
                func = function()
                    card.ability.extra.StaticMult = math.max(0, (card.ability.extra.StaticMult) - 1)
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.StaticMult
            }
        end
    end
}