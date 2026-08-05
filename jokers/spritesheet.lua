
SMODS.Joker{ --Sprite sheet
    key = "spritesheet",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sprite sheet',
        ['text'] = {
            [1] = '{C:blue}+25{} Chips for every filled joker slot',
            [2] = '{C:inactive}(Currently {}{C:blue}+#1# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 25}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = (#(G.jokers and G.jokers.cards or {})) * 25
            }
        end
    end
}