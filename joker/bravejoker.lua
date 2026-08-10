
SMODS.Joker{ --Brave Joker
    key = "bravejoker",
    config = {
        extra = {
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Brave Joker',
        ['text'] = {
            [1] = '{C:money}+2${} if played hand',
            [2] = 'is a {C:attention}Two Pair{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if context.scoring_name == "Two Pair" then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 2
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}