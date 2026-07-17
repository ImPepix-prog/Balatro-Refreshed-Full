SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/lazyjoker.lua"))()
    assert(SMODS.load_file("jokers/jackpot.lua"))()
    assert(SMODS.load_file("jokers/jokerapp.lua"))()
    assert(SMODS.load_file("jokers/yoyleland.lua"))()
    assert(SMODS.load_file("jokers/hornet.lua"))()
    assert(SMODS.load_file("jokers/machinelove.lua"))()
    assert(SMODS.load_file("jokers/toxicjoker.lua"))()
    assert(SMODS.load_file("jokers/static.lua"))()
    assert(SMODS.load_file("jokers/spokenfor.lua"))()
    assert(SMODS.load_file("jokers/hitomaniac.lua"))()
    assert(SMODS.load_file("jokers/feverdream.lua"))()
    assert(SMODS.load_file("jokers/nerdjoker.lua"))()
    assert(SMODS.load_file("jokers/duality.lua"))()
    assert(SMODS.load_file("jokers/pngjoker.lua"))()
    assert(SMODS.load_file("jokers/medicine.lua"))()
    assert(SMODS.load_file("jokers/monitoring.lua"))()
    assert(SMODS.load_file("jokers/monitoringbestfriendedition.lua"))()
    assert(SMODS.load_file("jokers/tetopear.lua"))()
    assert(SMODS.load_file("jokers/toilet.lua"))()
    assert(SMODS.load_file("jokers/jokeruser.lua"))()
    assert(SMODS.load_file("jokers/divorcepapers.lua"))()
    assert(SMODS.load_file("jokers/bottleopener.lua"))()
    assert(SMODS.load_file("jokers/brainimplosionenergydrink.lua"))()
    assert(SMODS.load_file("jokers/spongy.lua"))()
    assert(SMODS.load_file("jokers/mjoker.lua"))()
    assert(SMODS.load_file("jokers/spritesheet.lua"))()
    assert(SMODS.load_file("jokers/rekoj.lua"))()
    assert(SMODS.load_file("jokers/jokerpack.lua"))()
    assert(SMODS.load_file("jokers/cellphone.lua"))()
    assert(SMODS.load_file("jokers/copperjoker.lua"))()
    assert(SMODS.load_file("jokers/neruflipphone.lua"))()
    assert(SMODS.load_file("jokers/nyancat.lua"))()
    assert(SMODS.load_file("jokers/wiring.lua"))()
    assert(SMODS.load_file("jokers/baguette.lua"))()
    assert(SMODS.load_file("jokers/spaming.lua"))()
    assert(SMODS.load_file("jokers/_4leafclover.lua"))()
    assert(SMODS.load_file("jokers/dirtyjoker.lua"))()
    assert(SMODS.load_file("jokers/luckyjoker.lua"))()
    assert(SMODS.load_file("jokers/paranoia.lua"))()
    assert(SMODS.load_file("jokers/liardancer.lua"))()
    assert(SMODS.load_file("jokers/pinkslip.lua"))()
    assert(SMODS.load_file("jokers/openutau.lua"))()
    assert(SMODS.load_file("jokers/tetoword.lua"))()
    assert(SMODS.load_file("jokers/akage.lua"))()
    assert(SMODS.load_file("jokers/override.lua"))()
    assert(SMODS.load_file("jokers/executionclap.lua"))()
    assert(SMODS.load_file("jokers/birdbrain.lua"))()
    assert(SMODS.load_file("jokers/tetoterritory.lua"))()
    assert(SMODS.load_file("jokers/backrooms.lua"))()
    assert(SMODS.load_file("jokers/depression.lua"))()
    assert(SMODS.load_file("jokers/manipulation.lua"))()
    assert(SMODS.load_file("jokers/love.lua"))()
    assert(SMODS.load_file("jokers/hatsunemiku.lua"))()
    assert(SMODS.load_file("jokers/kasaneteto.lua"))()
    assert(SMODS.load_file("jokers/akitaneru.lua"))()
    assert(SMODS.load_file("jokers/momomemomo.lua"))()
    assert(SMODS.load_file("jokers/meguminakajima.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/elgallo.lua"))()
    assert(SMODS.load_file("consumables/elborracho.lua"))()
    assert(SMODS.load_file("consumables/elvaliente.lua"))()
    assert(SMODS.load_file("consumables/lamaceta.lua"))()
    assert(SMODS.load_file("consumables/elpescado.lua"))()
    assert(SMODS.load_file("consumables/elalacran.lua"))()
    assert(SMODS.load_file("consumables/laestrella.lua"))()
    assert(SMODS.load_file("consumables/elsol.lua"))()
    assert(SMODS.load_file("consumables/laluna.lua"))()
    assert(SMODS.load_file("consumables/labotella.lua"))()
    assert(SMODS.load_file("consumables/lamano.lua"))()
    assert(SMODS.load_file("consumables/labota.lua"))()
    assert(SMODS.load_file("consumables/elgorrito.lua"))()
    assert(SMODS.load_file("consumables/lacorona.lua"))()
    assert(SMODS.load_file("consumables/lacampana.lua"))()
    assert(SMODS.load_file("consumables/lasirena.lua"))()
    assert(SMODS.load_file("consumables/elapache.lua"))()
    assert(SMODS.load_file("consumables/elcatrin.lua"))()
    assert(SMODS.load_file("consumables/lasandia.lua"))()
    assert(SMODS.load_file("consumables/larana.lua"))()
    assert(SMODS.load_file("consumables/elcantarito.lua"))()
    assert(SMODS.load_file("consumables/elcazo.lua"))()
end
--load the sets
assert(SMODS.load_file("consumables/sets.lua"))()
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/copper.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/teto_deck.lua"))()
end


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
SMODS.ObjectType({
    key = "Refreshed_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_Refreshed_jokers",
    cards = {
        ["j_Refreshed_lazyjoker"] = true,
        ["j_Refreshed_jackpot"] = true,
        ["j_Refreshed_jokerapp"] = true,
        ["j_Refreshed_yoyleland"] = true,
        ["j_Refreshed_hornet"] = true,
        ["j_Refreshed_machinelove"] = true,
        ["j_Refreshed_toxicjoker"] = true,
        ["j_Refreshed_static"] = true,
        ["j_Refreshed_spokenfor"] = true,
        ["j_Refreshed_hitomaniac"] = true,
        ["j_Refreshed_feverdream"] = true,
        ["j_Refreshed_nerdjoker"] = true,
        ["j_Refreshed_duality"] = true,
        ["j_Refreshed_pngjoker"] = true,
        ["j_Refreshed_medicine"] = true,
        ["j_Refreshed_monitoring"] = true,
        ["j_Refreshed_tetopear"] = true,
        ["j_Refreshed_toilet"] = true,
        ["j_Refreshed_jokeruser"] = true,
        ["j_Refreshed_divorcepapers"] = true,
        ["j_Refreshed_bottleopener"] = true,
        ["j_Refreshed_brainimplosionenergydrink"] = true,
        ["j_Refreshed_spongy"] = true,
        ["j_Refreshed_mjoker"] = true,
        ["j_Refreshed_spritesheet"] = true,
        ["j_Refreshed_rekoj"] = true,
        ["j_Refreshed_jokerpack"] = true,
        ["j_Refreshed_cellphone"] = true,
        ["j_Refreshed_copperjoker"] = true,
        ["j_Refreshed_neruflipphone"] = true,
        ["j_Refreshed_nyancat"] = true,
        ["j_Refreshed_wiring"] = true,
        ["j_Refreshed_baguette"] = true,
        ["j_Refreshed_spaming"] = true,
        ["j_Refreshed__4leafclover"] = true,
        ["j_Refreshed_dirtyjoker"] = true,
        ["j_Refreshed_luckyjoker"] = true,
        ["j_Refreshed_paranoia"] = true,
        ["j_Refreshed_liardancer"] = true,
        ["j_Refreshed_pinkslip"] = true,
        ["j_Refreshed_openutau"] = true,
        ["j_Refreshed_tetoword"] = true,
        ["j_Refreshed_akage"] = true,
        ["j_Refreshed_override"] = true,
        ["j_Refreshed_executionclap"] = true,
        ["j_Refreshed_birdbrain"] = true,
        ["j_Refreshed_tetoterritory"] = true,
        ["j_Refreshed_backrooms"] = true,
        ["j_Refreshed_depression"] = true,
        ["j_Refreshed_manipulation"] = true,
        ["j_Refreshed_love"] = true,
        ["j_Refreshed_hatsunemiku"] = true,
        ["j_Refreshed_kasaneteto"] = true,
        ["j_Refreshed_akitaneru"] = true,
        ["j_Refreshed_momomemomo"] = true,
        ["j_Refreshed_meguminakajima"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_teto_joker",
    cards = {
        ["j_Refreshed_machinelove"] = true,
        ["j_Refreshed_spokenfor"] = true,
        ["j_Refreshed_hitomaniac"] = true,
        ["j_Refreshed_medicine"] = true,
        ["j_Refreshed_tetopear"] = true,
        ["j_Refreshed_brainimplosionenergydrink"] = true,
        ["j_Refreshed_baguette"] = true,
        ["j_Refreshed_liardancer"] = true,
        ["j_Refreshed_tetoword"] = true,
        ["j_Refreshed_akage"] = true,
        ["j_Refreshed_override"] = true,
        ["j_Refreshed_executionclap"] = true,
        ["j_Refreshed_birdbrain"] = true,
        ["j_Refreshed_tetoterritory"] = true,
        ["j_Refreshed_depression"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_REALteto_joker",
    cards = {
        ["j_Refreshed_machinelove"] = true,
        ["j_Refreshed_spokenfor"] = true,
        ["j_Refreshed_hitomaniac"] = true,
        ["j_Refreshed_medicine"] = true,
        ["j_Refreshed_brainimplosionenergydrink"] = true,
        ["j_Refreshed_baguette"] = true,
        ["j_Refreshed_liardancer"] = true,
        ["j_Refreshed_tetoword"] = true,
        ["j_Refreshed_akage"] = true,
        ["j_Refreshed_override"] = true,
        ["j_Refreshed_executionclap"] = true,
        ["j_Refreshed_birdbrain"] = true,
        ["j_Refreshed_tetoterritory"] = true,
        ["j_Refreshed_depression"] = true,
        ["j_Refreshed_kasaneteto"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_Vocaloid",
    cards = {
        ["j_Refreshed_machinelove"] = true,
        ["j_Refreshed_static"] = true,
        ["j_Refreshed_spokenfor"] = true,
        ["j_Refreshed_hitomaniac"] = true,
        ["j_Refreshed_medicine"] = true,
        ["j_Refreshed_monitoring"] = true,
        ["j_Refreshed_tetopear"] = true,
        ["j_Refreshed_brainimplosionenergydrink"] = true,
        ["j_Refreshed_neruflipphone"] = true,
        ["j_Refreshed_baguette"] = true,
        ["j_Refreshed_liardancer"] = true,
        ["j_Refreshed_openutau"] = true,
        ["j_Refreshed_tetoword"] = true,
        ["j_Refreshed_akage"] = true,
        ["j_Refreshed_override"] = true,
        ["j_Refreshed_executionclap"] = true,
        ["j_Refreshed_birdbrain"] = true,
        ["j_Refreshed_tetoterritory"] = true,
        ["j_Refreshed_depression"] = true,
        ["j_Refreshed_manipulation"] = true,
        ["j_Refreshed_love"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_RealVocaloid",
    cards = {
        ["j_Refreshed_machinelove"] = true,
        ["j_Refreshed_static"] = true,
        ["j_Refreshed_spokenfor"] = true,
        ["j_Refreshed_hitomaniac"] = true,
        ["j_Refreshed_medicine"] = true,
        ["j_Refreshed_monitoring"] = true,
        ["j_Refreshed_monitoringbestfriendedition"] = true,
        ["j_Refreshed_tetopear"] = true,
        ["j_Refreshed_brainimplosionenergydrink"] = true,
        ["j_Refreshed_neruflipphone"] = true,
        ["j_Refreshed_baguette"] = true,
        ["j_Refreshed_liardancer"] = true,
        ["j_Refreshed_openutau"] = true,
        ["j_Refreshed_tetoword"] = true,
        ["j_Refreshed_akage"] = true,
        ["j_Refreshed_override"] = true,
        ["j_Refreshed_executionclap"] = true,
        ["j_Refreshed_birdbrain"] = true,
        ["j_Refreshed_tetoterritory"] = true,
        ["j_Refreshed_depression"] = true,
        ["j_Refreshed_manipulation"] = true,
        ["j_Refreshed_love"] = true,
        ["j_Refreshed_hatsunemiku"] = true,
        ["j_Refreshed_kasaneteto"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_Refreshed_joker",
    cards = {
        ["j_Refreshed_monitoringbestfriendedition"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_Neru",
    cards = {
        ["j_Refreshed_neruflipphone"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_RealNeru",
    cards = {
        ["j_Refreshed_neruflipphone"] = true,
        ["j_Refreshed_akitaneru"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_LegeVocaloid",
    cards = {
        ["j_Refreshed_hatsunemiku"] = true,
        ["j_Refreshed_kasaneteto"] = true,
        ["j_Refreshed_akitaneru"] = true,
        ["j_Refreshed_momomemomo"] = true,
        ["j_Refreshed_meguminakajima"] = true
    },
})

SMODS.ObjectType({
    key = "Refreshed_TrueVocaloid",
    cards = {
        ["j_Refreshed_akitaneru"] = true,
        ["j_Refreshed_momomemomo"] = true,
        ["j_Refreshed_meguminakajima"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end