
SMODS.Joker{ --Dirty Joker
    key = "dirtyjoker",
    config = {
        extra = {
            pb_mult_8fda7ada = 2
        }
    },
    loc_txt = {
        ['name'] = 'Dirty Joker',
        ['text'] = {
            [1] = 'Scored {C:attention}Face{} Cards',
            [2] = 'permanently gain {C:red}+2{} Mult',
            [3] = '{C:inactive}(Go watch Shimoneta, its peak){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + 2
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
    end
}