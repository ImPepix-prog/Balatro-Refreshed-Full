
SMODS.Joker{ --Calcetin con Rombos Man
    key = "calcetinconrombosman",
    config = {
        extra = {
            CcRMChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Calcetin con Rombos Man',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}5{}',
            [2] = 'Chips if played hand',
            [3] = 'contains a {C:attention}Two Pair{}',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CcRMChips}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if next(context.poker_hands["Two Pair"]) then
                return {
                    func = function()
                        card.ability.extra.CcRMChips = (card.ability.extra.CcRMChips) + 5
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.CcRMChips
            }
        end
    end
}