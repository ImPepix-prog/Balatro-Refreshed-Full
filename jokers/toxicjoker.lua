
SMODS.Joker{ --Toxic Joker
    key = "toxicjoker",
    config = {
        extra = {
            pb_h_mult_f1bc673a = 4
        }
    },
    loc_txt = {
        ['name'] = 'Toxic Joker',
        ['text'] = {
            [1] = 'Played cards permanently gain {C:red}+4{} Mult',
            [2] = 'that is given when held in hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
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
            context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult or 0
            context.other_card.ability.perma_h_mult = context.other_card.ability.perma_h_mult + 4
            return {
                extra = { message = "Upgraded!", colour = G.C.MULT }, card = card
            }
        end
    end
}