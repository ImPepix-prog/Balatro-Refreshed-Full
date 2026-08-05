
SMODS.Joker{ --Green Catfruit
    key = "greencatfruit",
    config = {
        extra = {
            pb_bonus_9066f6ae = 10,
            pb_mult_efbd3b28 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Green Catfruit',
        ['text'] = {
            [1] = 'Scored {C:attention}Suitless{} cards',
            [2] = 'gain {C:blue}+10{} extra Chips',
            [3] = 'and {C:red}+3{} extra Mult',
            [4] = 'destroys after a',
            [5] = '{C:attention}suit{} is scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
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
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if (context.other_card:is_suit("Spades") or context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") or context.other_card:is_suit("Clubs")) then
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
            elseif (not (context.other_card:is_suit("Spades")) and not (context.other_card:is_suit("Hearts")) and not (context.other_card:is_suit("Diamonds")) and not (context.other_card:is_suit("Clubs"))) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + 10
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 3
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}