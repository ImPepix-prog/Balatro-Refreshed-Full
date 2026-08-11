
SMODS.Joker{ --Owata Action Online
    key = "owataactiononline",
    config = {
        extra = {
            hand_size_increase = '2'
        }
    },
    loc_txt = {
        ['name'] = 'Owata Action Online',
        ['text'] = {
            [1] = 'only {C:attention}5 card hands{}',
            [2] = '{C:attention}+2{} hand size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 8
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
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#context.scoring_hand) ~= to_big(5) then
                error("Why do you breake the rules like that?, are you stupid or something like that?, better try again :p")
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-2)
    end
}