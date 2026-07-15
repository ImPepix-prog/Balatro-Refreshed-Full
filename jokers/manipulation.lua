
SMODS.Joker{ --Manipulation
    key = "manipulation",
    config = {
        extra = {
            ManipulationChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Manipulation',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+2{} Chips',
            [2] = 'for every scored {C:diamonds}Diamond{} or {C:clubs}Club{}',
            [3] = 'resets if a {C:hearts}Heart{} is scored',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 5
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ManipulationChips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Diamonds") or context.other_card:is_suit("Clubs")) then
                card.ability.extra.ManipulationChips = (card.ability.extra.ManipulationChips) + 2
                return {
                    message = "Upgrade!"
                }
            elseif context.other_card:is_suit("Hearts") then
                card.ability.extra.ManipulationChips = 0
                return {
                    message = "Reset"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.ManipulationChips
            }
        end
    end
}