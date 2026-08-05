
SMODS.Joker{ --Set of Books
    key = "setofbooks",
    config = {
        extra = {
            SetOfBooksXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Set of Books',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = '{C:attention}4 #2#s{} gain {X:mult,C:white}X0.5{} Mult',
            [3] = '{C:inactive}(Rank changes after',
            [4] = 'that hand is played){}',
            [5] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["Refreshed_Refreshed_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SetOfBooksXMult, localize((G.GAME.current_round.SetOfBooksRank_card or {}).rank or 'Ace', 'ranks')}}
    end,
    
    set_ability = function(self, card, initial)
        G.GAME.current_round.SetOfBooksRank_card = { rank = 'Ace', id = 14 }
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.SetOfBooksXMult
            }
        end
        if context.before and context.cardarea == G.jokers  then
            if (to_big(#context.full_hand) == to_big(4) and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:get_id() == G.GAME.current_round.SetOfBooksRank_card.id then
                        count = count + 1
                    end
                end
                return count == #context.full_hand
            end)()) then
                if G.playing_cards then
                    local valid_SetOfBooksRank_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_rank(v) then
                            valid_SetOfBooksRank_cards[#valid_SetOfBooksRank_cards + 1] = v
                        end
                    end
                    if valid_SetOfBooksRank_cards[1] then
                        local SetOfBooksRank_card = pseudorandom_element(valid_SetOfBooksRank_cards, pseudoseed('SetOfBooksRank' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.SetOfBooksRank_card.rank = SetOfBooksRank_card.base.value
                        G.GAME.current_round.SetOfBooksRank_card.id = SetOfBooksRank_card.base.id
                    end
                end
                return {
                    func = function()
                        card.ability.extra.SetOfBooksXMult = (card.ability.extra.SetOfBooksXMult) + 0.5
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
    end
}