
SMODS.Joker{ --Monika
    key = "monika",
    config = {
        extra = {
            odds = 4,
            mult0_min = NaN,
            mult0_max = 100,
            chips0_min = NaN,
            chips0_max = 1000,
            xmult0_min = NaN,
            xmult0_max = 50,
            dollars0_min = NaN,
            dollars0_max = 25,
            dollars_min = NaN,
            dollars_max = 25,
            dollars2_min = NaN,
            dollars2_max = 150,
            odds2 = 4,
            chips_min = NaN,
            chips_max = 100,
            mult_min = NaN,
            mult_max = 15,
            xmult_min = NaN,
            xmult_max = 2.5,
            repetitions0_min = NaN,
            repetitions0_max = 5,
            dollars3_min = NaN,
            dollars3_max = 5,
            odds3 = 4,
            odds2 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Monika',
        ['text'] = {
            [1] = 'Just {C:attention}Monika{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 0,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_Refreshed_monika')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_Refreshed_monika')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_Refreshed_monika')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_Refreshed_monika')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_Refreshed_monika')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds6, 'j_Refreshed_monika')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds7, 'j_Refreshed_monika')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds8, 'j_Refreshed_monika')
        local new_numerator9, new_denominator9 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds9, 'j_Refreshed_monika')
        local new_numerator10, new_denominator10 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds10, 'j_Refreshed_monika')
        local new_numerator11, new_denominator11 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds11, 'j_Refreshed_monika')
        local new_numerator12, new_denominator12 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds12, 'j_Refreshed_monika')
        local new_numerator13, new_denominator13 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds13, 'j_Refreshed_monika')
        local new_numerator14, new_denominator14 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds14, 'j_Refreshed_monika')
        local new_numerator15, new_denominator15 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds15, 'j_Refreshed_monika')
        local new_numerator16, new_denominator16 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds16, 'j_Refreshed_monika')
        local new_numerator17, new_denominator17 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds17, 'j_Refreshed_monika')
        local new_numerator18, new_denominator18 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds18, 'j_Refreshed_monika')
        local new_numerator19, new_denominator19 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds19, 'j_Refreshed_monika')
        local new_numerator20, new_denominator20 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds20, 'j_Refreshed_monika')
        local new_numerator21, new_denominator21 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds21, 'j_Refreshed_monika')
        local new_numerator22, new_denominator22 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds22, 'j_Refreshed_monika')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8, new_numerator9, new_denominator9, new_numerator10, new_denominator10, new_numerator11, new_denominator11, new_numerator12, new_denominator12, new_numerator13, new_denominator13, new_numerator14, new_denominator14, new_numerator15, new_denominator15, new_numerator16, new_denominator16, new_numerator17, new_denominator17, new_numerator18, new_denominator18, new_numerator19, new_denominator19, new_numerator20, new_denominator20, new_numerator21, new_denominator21, new_numerator22, new_denominator22}}
    end,
    
    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_ecb639a3', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                    SMODS.calculate_effect({mult = pseudorandom('RANGE:1|100', 1, 100)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_b9ca830b', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                    SMODS.calculate_effect({chips = pseudorandom('RANGE:1|1000', 1, 1000)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_9ab92b18', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                    SMODS.calculate_effect({balance = true}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_ebb80126', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                    SMODS.calculate_effect({swap = true}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_4_35c7d46a', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                    SMODS.calculate_effect({Xmult = pseudorandom('RANGE:0.5|50', 0.5, 50)}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_5_9f307b0f', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + pseudorandom('RANGE:0|25', 0, 25)
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:0|25', 0, 25)), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                    if SMODS.pseudorandom_probability(card, 'group_6_f84130e7', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                        SMODS.calculate_effect({
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars - pseudorandom('RANGE:0|25', 0, 25)
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(pseudorandom('RANGE:0|25', 0, 25)), colour = G.C.MONEY})
                                return true
                            end}, card)
                        end
                        if SMODS.pseudorandom_probability(card, 'group_7_dc0de1b8', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                            SMODS.calculate_effect({
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = pseudorandom('RANGE:-50|150', -50, 150)
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(pseudorandom('RANGE:-50|150', -50, 150)), colour = G.C.MONEY})
                                    return true
                                end}, card)
                            end
                        end
                    end
                    if context.destroy_card and context.destroy_card.should_destroy  then
                        return { remove = true }
                    end
                    if context.individual and context.cardarea == G.play  then
                        context.other_card.should_destroy = false
                        if true then
                            if SMODS.pseudorandom_probability(card, 'group_0_8a33d4b3', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                SMODS.calculate_effect({chips = pseudorandom('RANGE:0|100', 0, 100)}, card)
                            end
                            if SMODS.pseudorandom_probability(card, 'group_1_2dfdce26', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                SMODS.calculate_effect({mult = pseudorandom('RANGE:0|15', 0, 15)}, card)
                            end
                            if SMODS.pseudorandom_probability(card, 'group_2_3fa80ddf', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                SMODS.calculate_effect({Xmult = pseudorandom('RANGE:1|2.5', 1, 2.5)}, card)
                            end
                            if SMODS.pseudorandom_probability(card, 'group_3_1ba3a765', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                
                                return {repetitions = pseudorandom('RANGE:0|5', 0, 5)}
                            end
                            if SMODS.pseudorandom_probability(card, 'group_4_07505261', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                                copied_card:add_to_deck()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                table.insert(G.playing_cards, copied_card)
                                G.hand:emplace(copied_card)
                                copied_card.states.visible = nil
                                G.E_MANAGER:add_event(Event({
                                    func = function() 
                                        copied_card:start_materialize()
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Card to Hand!", colour = G.C.GREEN})
                            end
                            if SMODS.pseudorandom_probability(card, 'group_5_611475e2', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                local scored_card = context.other_card
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        
                                        assert(SMODS.change_base(scored_card, pseudorandom_element(SMODS.Suits, 'edit_card_suit').key, nil))
                                        local enhancement_pool = {}
                                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                                            if enhancement.key ~= 'm_stone' then
                                                enhancement_pool[#enhancement_pool + 1] = enhancement
                                            end
                                        end
                                        local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                                        scored_card:set_ability(random_enhancement)
                                        local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                                        if random_seal then
                                            scored_card:set_seal(random_seal, true)
                                        end
                                        local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                                        if random_edition then
                                            scored_card:set_edition(random_edition, true)
                                        end
                                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                                        return true
                                    end
                                }))
                                
                            end
                            if SMODS.pseudorandom_probability(card, 'group_6_9d283db0', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                SMODS.calculate_effect({
                                    func = function()
                                        
                                        local current_dollars = G.GAME.dollars
                                        local target_dollars = G.GAME.dollars + pseudorandom('RANGE:0|5', 0, 5)
                                        local dollar_value = target_dollars - current_dollars
                                        ease_dollars(dollar_value)
                                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(pseudorandom('RANGE:0|5', 0, 5)), colour = G.C.MONEY})
                                        return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_7_5407744d', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                        G.E_MANAGER:add_event(Event({
                                            trigger = 'after',
                                            delay = 0.4,
                                            func = function()
                                                play_sound('timpani')
                                                local sets = {'Tarot', 'Planet', 'Spectral'}
                                                local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                                SMODS.add_card({ set = random_set, })                            
                                                card:juice_up(0.3, 0.5)
                                                return true
                                            end
                                        }))
                                    end
                                    delay(0.6)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_consumable') or nil, colour = G.C.PURPLE})
                                end
                                if SMODS.pseudorandom_probability(card, 'group_8_911ca3c0', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                    context.other_card.should_destroy = true
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                end
                            end
                        end
                        if context.setting_blind  then
                            if true then
                                if SMODS.pseudorandom_probability(card, 'group_0_054e78ac', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                    SMODS.calculate_effect({func = function()
                                        local destructable_jokers = {}
                                        for i, joker in ipairs(G.jokers.cards) do
                                            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                                table.insert(destructable_jokers, joker)
                                            end
                                        end
                                        local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                                        
                                        if target_joker then
                                            target_joker.getting_sliced = true
                                            G.E_MANAGER:add_event(Event({
                                                func = function()
                                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                                    return true
                                                end
                                            }))
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Just Monika!", colour = G.C.RED})
                                        end
                                        return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_1_7a5c234d', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                    SMODS.calculate_effect({func = function()
                                        local available_jokers = {}
                                        for i, joker in ipairs(G.jokers.cards) do
                                            table.insert(available_jokers, joker)
                                        end
                                        local target_joker = #available_jokers > 0 and pseudorandom_element(available_jokers, pseudoseed('copy_joker')) or nil
                                        
                                        if target_joker and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                            G.E_MANAGER:add_event(Event({
                                                func = function()
                                                    local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                                                    
                                                    copied_joker:add_to_deck()
                                                    G.jokers:emplace(copied_joker)
                                                    G.GAME.joker_buffer = 0
                                                    return true
                                                end
                                            }))
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_duplicated_ex'), colour = G.C.GREEN})
                                        end
                                        return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_2_70edcdb0', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                    SMODS.calculate_effect({func = function()
                                        
                                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                                            G.E_MANAGER:add_event(Event({
                                                trigger = 'after',
                                                delay = 0.4,
                                                func = function()
                                                    play_sound('timpani')
                                                    local sets = {'Tarot', 'Planet', 'Spectral'}
                                                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                                    SMODS.add_card({ set = random_set, })                            
                                                    card:juice_up(0.3, 0.5)
                                                    return true
                                                end
                                            }))
                                        end
                                        delay(0.6)
                                        
                                        if created_consumable then
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                                        end
                                        return true
                                    end}, card)
                                end
                                if SMODS.pseudorandom_probability(card, 'group_3_47488308', 1, card.ability.extra.odds, 'j_Refreshed_monika', true) then
                                    local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                                    local base_card = create_playing_card({
                                        front = card_front,
                                        center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                                    }, G.discard, true, false, nil, true)
                                    
                                    base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple'}, pseudoseed('add_card_hand_seal')), true)
                                    
                                    base_card:set_edition(pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, pseudoseed('add_card_hand_edition')), true)
                                    
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            base_card:start_materialize()
                                            G.play:emplace(base_card)
                                            return true
                                        end
                                    }))
                                    SMODS.calculate_effect({func = function()
                                        G.E_MANAGER:add_event(Event({
                                            func = function()
                                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                                return true
                                            end
                                        }))
                                        draw_card(G.play, G.deck, 90, 'up')
                                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                                    end}, card)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                                end
                                if SMODS.pseudorandom_probability(card, 'group_4_9daba5dd', 1, card.ability.extra.odds2, 'j_Refreshed_monika', true) then
                                    SMODS.calculate_effect({func = function()
                                        local target_joker = card
                                        
                                        if target_joker then
                                            target_joker.getting_sliced = true
                                            G.E_MANAGER:add_event(Event({
                                                func = function()
                                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                                    return true
                                                end
                                            }))
                                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                                        end
                                        return true
                                    end}, card)
                                end
                            end
                        end
                    end
                }