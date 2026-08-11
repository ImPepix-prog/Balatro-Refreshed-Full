
SMODS.Joker{ --Joker Pack
    key = "jokerpack",
    config = {
        extra = {
            booster_slots_increase = '1'
        }
    },
    loc_txt = {
        ['name'] = 'Joker Pack',
        ['text'] = {
            [1] = '{C:attention}+1{} Booster',
            [2] = 'Pack slots'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(1)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-1)
    end
}