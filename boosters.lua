
SMODS.Booster {
    key = 'loteria_pack',
    loc_txt = {
        name = "Loteria pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}3{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_loteria_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'loteriapack2',
    loc_txt = {
        name = "Loteria pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}3{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_loteriapack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'loteriapack3',
    loc_txt = {
        name = "Loteria pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}3{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_loteriapack3"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'loteriapack4',
    loc_txt = {
        name = "Loteria pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}3{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 3, choose = 1 },
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_loteriapack4"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_loteria_pack',
    loc_txt = {
        name = "Jumbo Loteria pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}5{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 6,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 4, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_jumbo_loteria_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'jumbo_loteria_pack2',
    loc_txt = {
        name = "Jumbo Loteria pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}5{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 6,
    weight = 0.5,
    atlas = "CustomBoosters",
    pos = { x = 5, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_jumbo_loteria_pack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'mega_loteria_pack',
    loc_txt = {
        name = "Mega Loteria pack",
        text = {
            [1] = 'Choose {C:attention}2{} of up to {C:attention}5{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 8,
    weight = 0.15,
    atlas = "CustomBoosters",
    pos = { x = 6, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_mega_loteria_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'megaloteriapack2',
    loc_txt = {
        name = "Mega Loteria pack",
        text = {
            [1] = 'Choose {C:attention}2{} of up to {C:attention}5{} {C:purple}Loteria{} cards'
        },
        group_name = "Loteria Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 8,
    weight = 0.15,
    atlas = "CustomBoosters",
    pos = { x = 7, y = 0 },
    kind = 'Loteria',
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "loteria",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "Refreshed_megaloteriapack2"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("bd10e0"))
        ease_background_colour({ new_colour = HEX('bd10e0'), special_colour = HEX("bd10e0"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
