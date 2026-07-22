
SMODS.Joker{ --Momome Momo
    key = "momomemomo",
    config = {
        extra = {
            wildcardsindeck = 1
        }
    },
    loc_txt = {
        ['name'] = 'Momome Momo',
        ['text'] = {
            [1] = 'when beating the boss blind creates a {C:attention}Nyan Cat{}',
            [2] = 'if theres space, this Joker gains {X:mult,C:white}X1{} Mult',
            [3] = 'for every wild card in your full deck',
            [4] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 6
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
        x = 7,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
            or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.wildcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)())}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                func = function()
                    
                    local created_joker = false
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        created_joker = true
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_Refreshed_nyancat' })
                                if joker_card then
                                    
                                    
                                end
                                G.GAME.joker_buffer = 0
                                return true
                            end
                        }))
                    end
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Meow!", colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            Xmult = card.ability.extra.wildcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_wild') then count = count + 1 end end; return count end)())
            }
        end
    end
}