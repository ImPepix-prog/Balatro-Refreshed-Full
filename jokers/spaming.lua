
SMODS.Joker{ --Spaming
    key = "spaming",
    config = {
        extra = {
            repetitions0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Spaming',
        ['text'] = {
            [1] = '{C:attention}Retriggers{} last scoring card {C:attention}3 aditional times{}',
            [2] = 'only if its a {C:attention}Face{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 3
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
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (function()
                for i = #context.scoring_hand, 1, -1 do
                    local scoring_card = context.scoring_hand[i]
                    if scoring_card:is_face() then
                        return scoring_card == context.other_card
                    end
                end
                return false
            end)() then
                return {
                    repetitions = 3,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}