
SMODS.Joker{ --Battery Acid
    key = "batteryacid",
    config = {
        extra = {
            cardsinhand = 1
        }
    },
    loc_txt = {
        ['name'] = 'Battery Acid',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult per',
            [2] = '{C:attention}Held in hand{} cards',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
        
        return {vars = {card.ability.extra.cardsinhand + ((#(G.hand and G.hand.cards or {}) or 0)) * 0.5}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.cardsinhand + (#(G.hand and G.hand.cards or {})) * 0.5
            }
        end
    end
}