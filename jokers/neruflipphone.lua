
SMODS.Joker{ --Neru Flip Phone
    key = "neruflipphone",
    config = {
        extra = {
            FlipPhoneChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Neru Flip Phone',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+5{} Chips when',
            [2] = 'you play your {C:attention}most played hand{}',
            [3] = '{C:inactive}(Currently {}{C:blue}+#1# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true, ["Refreshed_Neru"] = true, ["Refreshed_RealNeru"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.FlipPhoneChips}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
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
                        card.ability.extra.FlipPhoneChips = (card.ability.extra.FlipPhoneChips) + 5
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.FlipPhoneChips
            }
        end
    end
}