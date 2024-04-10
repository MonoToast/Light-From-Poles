data:extend({
    {
        type = "lamp",
        name = "pole-lamp",
        icon = "__base__/graphics/icons/small-lamp.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {"placeable-neutral", "player-creation"},
        collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
        energy_source = {type = "void"},
        energy_usage_per_tick = "1KW",
        light = {intensity = 0.9, size = 40, color = {r = 1.0, g = 1.0, b = 0.75}},
        picture_off = {filename = "__light-from-poles__/empty.png", size = 32},
        picture_on = {filename = "__light-from-poles__/empty.png", size = 32}
    }
})