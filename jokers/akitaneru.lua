
SMODS.Joker{ --Akita Neru
    key = "akitaneru",
    config = {
        extra = {
            NeruXMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Akita Neru',
        ['text'] = {
            [1] = 'This Joker gains {X:mult,C:white}X0.5{} Mult',
            [2] = 'every time you play your most played hand',
            [3] = '{C:inactive}(Currently {}{X:mult,C:white}X#1# {}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["Refreshed_Refreshed_jokers"] = true, ["Refreshed_TrueVocaloid"] = true, ["Refreshed_RealNeru"] = true, ["Refreshed_LegeVocaloid"] = true },
    soul_pos = {
        x = 5,
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
        
        return {vars = {card.ability.extra.NeruXMult}}
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
                return {
                    func = function()
                        card.ability.extra.NeruXMult = (card.ability.extra.NeruXMult) + 0.5
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.NeruXMult
            }
        end
    end
}