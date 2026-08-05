
SMODS.Joker{ --Arizona
    key = "arizona",
    config = {
        extra = {
            ArizonaRemainingTime = 3,
            cardsinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Arizona',
        ['text'] = {
            [1] = 'Gain {C:money}1${} per {C:attention}Held in hand{}',
            [2] = 'cards, destroys after {C:attention}#1# hands{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "Refreshed_unique",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Drink"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'uta' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ArizonaRemainingTime, (#(G.hand and G.hand.cards or {}) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + #(G.hand and G.hand.cards or {})
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(#(G.hand and G.hand.cards or {})), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.ArizonaRemainingTime or 0)) <= to_big(1) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Dranked!", colour = G.C.RED})
                end
            else
                card.ability.extra.ArizonaRemainingTime = math.max(0, (card.ability.extra.ArizonaRemainingTime) - 1)
                return {
                    message = "-1 Hand!"
                }
            end
        end
    end
}