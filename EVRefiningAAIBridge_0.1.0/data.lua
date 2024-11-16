local item_sounds = require("__base__.prototypes.item_sounds")

data:extend {
    {
        type = "recipe",
        name = "craft-sand-to-fine",
        localised_name = "fine sand - Sand crushing",
        icon = "__EVRefiningAAIBridge__/graphics/icons/sand-to-fine.png",
        category = "basic-crafting",
        subgroup = "stone-processing",
        order = "ba",
        enabled = false,
        energy_required = 2,
        ingredients = {
            { type = "item", name = "sand", amount = 4 }
        },
        results = {
            { type = "item", name = "fine-sand", amount = 3 }
        },
        auto_recycle = false
    },
    {
        type = "recipe",
        name = "grind-sand-to-fine",
        localised_name = "fine sand - Sand crushing",
        icon = "__EVRefiningAAIBridge__/graphics/icons/grind-sand-to-fine.png",
        category = "crushing1",
        subgroup = "stone-processing",
        order = "ba",
        enabled = false,
        energy_required = 2,
        ingredients = {
            { type = "item", name = "sand", amount = 4 }
        },
        results = {
            { type = "item", name = "fine-sand", amount = 8 }
        },
        auto_recycle = false
    },
    {
        type = "recipe",
        name = "gravel-to-sand-2",
        localised_name = "Sand - Enhanced gravel crushing",
        icon = "__EVRefiningAAIBridge__/graphics/icons/gravel-to-sand-2.png",
        category = "crushing1",
        subgroup = "stone-processing",
        order = "ba",
        enabled = false,
        energy_required = 2.2,
        ingredients = {
            { type = "item", name = "gravel", amount = 4 }
        },
        results = {
            { type = "item", name = "sand", amount = 12 }
        },
        auto_recycle = false
    },
    {
        type = "item",
        name = "silicon",
        localised_name = "Silicon",
        icon = "__EVRefiningAAIBridge__/graphics/icons/silicon.png",
        subgroup = "ore-dust",
        order = "aa",
        pick_sound = item_sounds.landfill_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
        inventory_move_sound = item_sounds.sulfur_inventory_move,
        weight = 0.5*kg,
        stack_size = 50
    },
    {
        type = "item",
        name = "optical-fiber",
        localised_name = "Optical Fiber",
        icon = "__EVRefiningAAIBridge__/graphics/icons/optical-fiber.png",
        subgroup = data.raw.item["copper-cable"].subgroup,
        order = "aa",
        pick_sound = item_sounds.grenade_inventory_pickup,
        drop_sound = item_sounds.grenade_inventory_move,
        inventory_move_sound = item_sounds.grenade_inventory_move,
        weight = 0.1*kg,
        stack_size = 200
    },
    {
        type = "recipe",
        name = "sand-to-silicon",
        localised_name = "Silicon - Fine sand extraction",
        icon = "__EVRefiningAAIBridge__/graphics/icons/silicon.png",
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "c[oil-products]-b[sulfuric-acid]",
        energy_required = 1,
        enabled = false,
        ingredients = {
            { type = "item", name = "fine-sand", amount = 4 },
            { type = "fluid", name = "sulfuric-acid", amount = 10 }
        },
        results = {
            { type = "item", name = "silicon", amount = 8 },
            { type = "item", name = "carbon",  amount = 1,
              probability = 0.2, show_details_in_recipe_tooltip = false },
        },
        allow_productivity = true,
        crafting_machine_tint =
        {
          primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000}, -- #fff400ff
          secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000}, -- #ffd92bff
          tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000}, -- #dfdd98ff
          quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}, -- #f7ff04ff
        },
        auto_recycle = false
    },
    {
        type = "recipe",
        name = "optical-fiber",
        enabled = false,
        category = "smelting",
        energy_required = 4,
        ingredients = {
            { type = "item", name = "silicon", amount = 2 }
        },
        results = {
            { type = "item", name = "optical-fiber", amount = 6 }
        },
        allow_productivity = true,
    }
}