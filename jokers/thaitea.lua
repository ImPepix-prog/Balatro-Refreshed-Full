
SMODS.Joker{ --Thai Tea
    key = "thaitea",
    config = {
        extra = {
            ThaiTeaChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Thai Tea',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+10{} Chips',
            [2] = 'per scored card, {C:attention}resets{}',
            [3] = 'after hand is scored',
            [4] = '{C:inactive}(Currently {}{C:blue}+#1# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "Refreshed_unique",
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_Drink"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' and args.source ~= 'uta' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ThaiTeaChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.ThaiTeaChips
            }
        end
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.ThaiTeaChips = (card.ability.extra.ThaiTeaChips) + 10
            return {
                message = "Upgrade!"
            }
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.ThaiTeaChips = 0
                    return true
                end,
                message = "Reset!"
            }
        end
    end
}