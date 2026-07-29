
SMODS.Enhancement {
    key = 'bootleg',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            BootlegMult = 2
        }
    },
    loc_txt = {
        name = 'Bootleg',
        text = {
            [1] = '{C:red}+2{} Mult',
            [2] = '{C:inactive}Does nothing?{}'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.BootlegMult}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                mult = card.ability.extra.BootlegMult
            }
        end
    end
}