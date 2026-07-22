
SMODS.Joker{ --Override
    key = "override",
    config = {
        extra = {
            xmult0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Override',
        ['text'] = {
            [1] = '{X:mult,C:white}X3{} Mult If played hand',
            [2] = 'doesnt contain a',
            [3] = '{C:attention}#2# {}and a {C:attention}#1# {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 4
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.OverrideSuit_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.OverrideRank_card or {}).rank or 'Ace', 'ranks')}, colours = {G.C.SUITS[(G.GAME.current_round.OverrideSuit_card or {}).suit or 'Spades']}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.OverrideSuit_card = { suit = 'Spades' }
        G.GAME.current_round.OverrideRank_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (not ((function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_suit(G.GAME.current_round.OverrideSuit_card.suit) then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) and not ((function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.OverrideRank_card.id then
                        count = count + 1
                    end
                end
                return count >= 1
            end)())) then
                return {
                    Xmult = 3
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.playing_cards then
                local valid_OverrideSuit_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_suit(v) then
                        valid_OverrideSuit_cards[#valid_OverrideSuit_cards + 1] = v
                    end
                end
                if valid_OverrideSuit_cards[1] then
                    local OverrideSuit_card = pseudorandom_element(valid_OverrideSuit_cards, pseudoseed('OverrideSuit' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.OverrideSuit_card.suit = OverrideSuit_card.base.suit
                end
            end
            if G.playing_cards then
                local valid_OverrideRank_cards = {}
                for _, v in ipairs(G.playing_cards) do
                    if not SMODS.has_no_rank(v) then
                        valid_OverrideRank_cards[#valid_OverrideRank_cards + 1] = v
                    end
                end
                if valid_OverrideRank_cards[1] then
                    local OverrideRank_card = pseudorandom_element(valid_OverrideRank_cards, pseudoseed('OverrideRank' .. G.GAME.round_resets.ante))
                    G.GAME.current_round.OverrideRank_card.rank = OverrideRank_card.base.value
                    G.GAME.current_round.OverrideRank_card.id = OverrideRank_card.base.id
                end
            end
        end
    end
}