
SMODS.Joker{ --Porfiado
    key = "porfiado",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Porfiado',
        ['text'] = {
            [1] = 'Scored {C:attention}face{} cards',
            [2] = 'are transformed to {C:hearts}Hearts{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
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
            or args.source ~= 'rif' 
            or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.PorfiadoRank_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.PorfiadoRank_card = { rank = 'King', id = 13 }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card:is_face() then
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