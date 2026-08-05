
SMODS.Joker{ --Execution Clap
    key = "executionclap",
    config = {
        extra = {
            ExecutionClapXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Execution Clap',
        ['text'] = {
            [1] = 'If first {C:blue}hand{} of the {C:attention}round{}',
            [2] = 'is a single {C:attention}face{} card {C:red}Destroy {}',
            [3] = 'it and gain {X:mult,C:white}X0.25{} Mult',
            [4] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}',
            [5] = '{C:inactive}(Art & Suggestion by IceNova){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 4
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_teto_joker"] = true, ["Refreshed_REALteto_joker"] = true, ["Refreshed_Vocaloid"] = true, ["Refreshed_RealVocaloid"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ExecutionClapXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (to_big(#context.full_hand) == to_big(1) and G.GAME.current_round.hands_played == 0 and (function()
                local count = 0
                for _, playing_card in pairs(context.full_hand or {}) do
                    if playing_card:is_face() then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                context.other_card.should_destroy = true
                card.ability.extra.ExecutionClapXMult = (card.ability.extra.ExecutionClapXMult) + 0.25
                return {
                    message = "Upgrade!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.ExecutionClapXMult
            }
        end
    end
}