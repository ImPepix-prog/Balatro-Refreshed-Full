
SMODS.Joker{ --Birdbrain
    key = "birdbrain",
    config = {
        extra = {
            BirdbrainMult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Birdbrain',
        ['text'] = {
            [1] = 'transforms all scored {C:attention}Kings{} and {C:attention}Jacks{}',
            [2] = 'into {C:attention}Queens{} and for every tranformed',
            [3] = '{C:attention}King{} and {C:attention}Jack{} this {C:attention}Joker{} gains {C:red}+5{} Mult',
            [4] = '{C:inactive}(Currently{}{C:red} +#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.BirdbrainMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 11 or context.other_card:get_id() == 13) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Queen"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Change!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.BirdbrainMult = (card.ability.extra.BirdbrainMult) + 5
                return {
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.BirdbrainMult
            }
        end
    end
}