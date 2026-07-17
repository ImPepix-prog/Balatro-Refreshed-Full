
SMODS.Joker{ --Teto Pear
    key = "tetopear",
    config = {
        extra = {
            TetoPearRemainingTime = 3,
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Teto Pear',
        ['text'] = {
            [1] = '{X:mult,C:white}X3{} Mult for {C:attention}3{} rounds, {C:attention}+1{} round',
            [2] = 'for every played hand containing a two pair',
            [3] = '{C:inactive}(Currently{} {C:attention}#1# {}{C:inactive}rounds){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.TetoPearRemainingTime}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.TetoPearRemainingTime or 0)) <= to_big(0) then
                local target_joker = card
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Consumed!", colour = G.C.RED})
                end
            else
                return {
                    Xmult = 3
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.TetoPearRemainingTime = math.max(0, (card.ability.extra.TetoPearRemainingTime) - 1)
                    return true
                end,
                message = "-1 Round!"
            }
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if next(context.poker_hands["Two Pair"]) then
                return {
                    func = function()
                        card.ability.extra.TetoPearRemainingTime = (card.ability.extra.TetoPearRemainingTime) + 1
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
    end
}