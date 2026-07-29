
SMODS.Joker{ --Nerd Joker
    key = "nerdjoker",
    config = {
        extra = {
            mult0 = 20,
            chips0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Nerd Joker',
        ['text'] = {
            [1] = 'Played {C:attention}Aces{} give {C:red}+20{} Mult',
            [2] = 'other scoring cards give {C:blue}-5{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    mult = 20
                }
            elseif not (context.other_card:get_id() == 14) then
                return {
                    chips = 5
                }
            end
        end
    end
}