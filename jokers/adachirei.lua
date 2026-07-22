
SMODS.Joker{ --Adachi Rei
    key = "adachirei",
    config = {
        extra = {
            pb_x_mult_626654c3 = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Adachi Rei',
        ['text'] = {
            [1] = '{C:attention}Rankless{} cards gain',
            [2] = '{X:mult,C:white}x0.1{} Mult when scored'
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
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_TrueVocaloid"] = true, ["Refreshed_LegeVocaloid"] = true },
    soul_pos = {
        x = 1,
        y = 7
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not (context.other_card:get_id() == 2) and not (context.other_card:get_id() == 3) and not (context.other_card:get_id() == 4) and not (context.other_card:get_id() == 5) and not (context.other_card:get_id() == 6) and not (context.other_card:get_id() == 7) and not (context.other_card:get_id() == 8) and not (context.other_card:get_id() == 9) and not (context.other_card:get_id() == 10) and not (context.other_card:get_id() == 11) and not (context.other_card:get_id() == 12) and not (context.other_card:get_id() == 13) and not (context.other_card:get_id() == 14)) then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 0.1
                return {
                    extra = { message = "Upgrade!", colour = G.C.MULT }, card = card
                }
            end
        end
    end
}