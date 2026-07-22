
SMODS.Consumable {
    key = 'rtemperance',
    set = 'Tarot',
    pos = { x = 9, y = 2 },
    config = { 
        extra = {
            cardsinhand = 0   
        } 
    },
    loc_txt = {
        name = 'Temperance?',
        text = {
            [1] = 'Gain {C:money}1${} for every',
            [2] = '{C:attention}Held in hand{} card',
            [3] = 'and {C:attention}Destroy{} them'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                
                local current_dollars = G.GAME.dollars
                local target_dollars = G.GAME.dollars + #(G.hand and G.hand.cards or {})
                local dollar_value = target_dollars - current_dollars
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(#(G.hand and G.hand.cards or {})).." $", colour = G.C.RED})
                ease_dollars(dollar_value, true)
                return true
            end
        }))
        delay(0.6)
        local destroyed_cards = {}
        local temp_hand = {}
        
    for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )
        
        pseudoshuffle(temp_hand, 12345)
        
    for i = 1, #(G.hand and G.hand.cards or {}) do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}