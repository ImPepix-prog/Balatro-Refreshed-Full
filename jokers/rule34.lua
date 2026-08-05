
SMODS.Joker{ --Rule 34
    key = "rule34",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Rule 34',
        ['text'] = {
            [1] = 'transform all scored cards into',
            [2] = '{C:hearts}hearts{} if played hand contains',
            [3] = '{C:attention}3{} or {C:attention}4{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'uta' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (to_big(#context.full_hand) == to_big(3) or to_big(#context.full_hand) == to_big(4)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Hearts", nil))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Change!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}