
SMODS.Enhancement {
    key = 'copper',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            CopperMult = 8
        }
    },
    loc_txt = {
        name = 'Copper',
        text = {
            [1] = '{C:red}+8{} Mult when held in hand'
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
        return {vars = {card.ability.extra.CopperMult}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return {
                mult = card.ability.extra.CopperMult
            }
        end
    end
}