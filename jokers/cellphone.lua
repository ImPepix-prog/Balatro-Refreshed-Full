
SMODS.Joker{ --Cellphone
    key = "cellphone",
    config = {
        extra = {
            CellphoneXmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cellphone',
        ['text'] = {
            [1] = 'This joker gains {X:mult,C:white}X0.1{} Mult for every consecutive time',
            [2] = 'you play your most played hand.',
            [3] = 'Resets when you dont',
            [4] = 'play your most played hand',
            [5] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.CellphoneXmult}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
                return {
                    func = function()
                        card.ability.extra.CellphoneXmult = (card.ability.extra.CellphoneXmult) + 0.1
                        return true
                    end,
                    message = "Upgrade!"
                }
            elseif not ((function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)()) then
                return {
                    func = function()
                        card.ability.extra.CellphoneXmult = 1
                        return true
                    end,
                    message = "Reset!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.CellphoneXmult
            }
        end
    end
}