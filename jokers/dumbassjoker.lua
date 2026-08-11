
SMODS.Joker{ --Dumbass Joker
    key = "dumbassjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Dumbass Joker',
        ['text'] = {
            [1] = 'This Joker still belives',
            [2] = '{C:attention}he{} {C:hearts}loves{} him but {C:attention}he{} was',
            [3] = 'just using him for {C:attention}attention{}',
            [4] = 'because {C:attention}he{} feeled nice when',
            [5] = 'he treated {C:attention}him{} good.',
            [6] = 'This Joker {C:hearts}loves{} the other',
            [7] = 'person even when they already',
            [8] = 'have broke up and belives one day',
            [9] = '{C:attention}he{} will answear his messages and come back',
            [10] = '{C:inactive}(Destroy scored hearts){}',
            [11] = '{C:inactive}(Yes, im proyecting myself with this joker :p){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Hearts") then
                context.other_card.should_destroy = true
                return {
                    message = "Destroyed!"
                }
            end
        end
    end
}