
SMODS.Joker{ --Liar Dancer
    key = "liardancer",
    config = {
        extra = {
            source_rank_type = 'all',
            source_ranks = '{}',
            target_rank = '"LiarDancerRank"'
        }
    },
    loc_txt = {
        ['name'] = 'Liar Dancer',
        ['text'] = {
            [1] = 'Every {C:attention}card{} is considered a {C:attention}#1# {}',
            [2] = '{C:inactive}(Rank changes at the end of the round){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.LiarDancerRank_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.LiarDancerRank_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.playing_cards then
                local valid_LiarDancerRank_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_LiarDancerRank_cards[#valid_LiarDancerRank_cards + 1] = v
                    end
                end
                if valid_LiarDancerRank_cards[1] then
                    local LiarDancerRank_card = pseudorandom_element(valid_LiarDancerRank_cards, pseudoseed('LiarDancerRank' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.LiarDancerRank_card.rank = LiarDancerRank_card.base.value
                    G.GAME.current_round.LiarDancerRank_card.id = LiarDancerRank_card.base.id
                end
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        -- Combine ranks effect enabled
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        -- Combine ranks effect disabled
    end
}


local card_get_id_ref = Card.get_id
function Card:get_id()
    local original_id = card_get_id_ref(self)
    if not original_id then return original_id end

    if next(SMODS.find_card("j_Refreshed_liardancer")) then
        return 14
    end
    return original_id
end
