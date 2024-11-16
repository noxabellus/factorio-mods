local data_util = require("./data-util.lua")

local gravel_to_sand = data.raw.recipe["gravel-to-sand"]
gravel_to_sand.localised_name = "Sand - Gravel crushing"
gravel_to_sand.icon = "__EVRefiningAAIBridge__/graphics/icons/gravel-to-sand.png"
replaceResult(gravel_to_sand, "fine-sand", "sand")

local glass = data.raw.recipe["glass"]
replaceIngredient(glass, "sand", "fine-sand")

local sand_landfill = data.raw.recipe["sand-landfill"]
sand_landfill.icon = "__EVRefiningAAIBridge__/graphics/icons/sand-landfill.png"
replaceIngredient(sand_landfill, "fine-sand", "sand")

local concrete_finishing = data.raw.recipe["concrete-finishing"]
concrete_finishing.icon = "__EVRefiningAAIBridge__/graphics/icons/concrete-finishing.png"
replaceIngredient(concrete_finishing, "fine-sand", "sand")

local sand_to_brick = data.raw.recipe["sand-to-brick"]
sand_to_brick.localised_name = "Stone brick - Sand smelting"
sand_to_brick.icon = "__EVRefiningAAIBridge__/graphics/icons/sand-to-brick.png"
replaceIngredient(sand_to_brick, "fine-sand", "sand")

local silicon_wafer_item = data.raw.item["stone-tablet"]
silicon_wafer_item.localised_name = "Silicon Wafer"
silicon_wafer_item.icon = "__EVRefiningAAIBridge__/graphics/icons/silicon-wafer.png"

local silicon_wafer_recipe = data.raw.recipe["stone-tablet"]
silicon_wafer_recipe.localised_name = "Silicon Wafer"
silicon_wafer_recipe.icon = "__EVRefiningAAIBridge__/graphics/icons/silicon-wafer.png"
silicon_wafer_recipe.category = "smelting"
silicon_wafer_recipe.energy_required = 4
silicon_wafer_recipe.ingredients = {
    { type = "item", name = "silicon", amount = 8 }
}
silicon_wafer_recipe.results = {
    { type = "item", name = silicon_wafer_item.name, amount = 8 }
}

local electronic_circuit = data.raw.recipe["electronic-circuit"]
electronic_circuit.category = "electronics-or-assembling"
electronic_circuit.energy_required = 1.5
electronic_circuit.ingredients = {
    { type = "item", name = "copper-cable", amount = 1 },
    { type = "item", name = silicon_wafer_item.name, amount = 2 }
}
electronic_circuit.results = {
    { type = "item", name = "electronic-circuit", amount = 2 }
}

local electronic_circuit_wood = data.raw.recipe["electronic-circuit-wood"]
electronic_circuit_wood.allow_as_intermediate = true

local sand_processing = data.raw.technology["sand-processing"]
unlockRecipe(sand_processing, "craft-sand-to-fine")

local base_ore_processing = data.raw.technology["base-ore-processing"]
unlockRecipe(base_ore_processing, "gravel-to-sand")
unlockRecipe(base_ore_processing, "grind-sand-to-fine")

local advanced_ore_processing = data.raw.technology["advanced-ore-processing"]
lockRecipe(advanced_ore_processing, "gravel-to-sand")
unlockRecipe(advanced_ore_processing, "gravel-to-sand-2")

local sulfur_processing = data.raw.technology["sulfur-processing"]
unlockRecipe(sulfur_processing, "sand-to-silicon")
unlockRecipe(sulfur_processing, silicon_wafer_recipe.name)
unlockRecipe(sulfur_processing, "electronic-circuit")

local processing_unit_recipe = data.raw.recipe["processing-unit"]
replaceIngredient(processing_unit_recipe, "electronic-circuit", "electronic-circuit", 6)
addIngredient(processing_unit_recipe, "optical-fiber", 8)

local processing_unit_technology = data.raw.technology["processing-unit"]
unlockRecipe(processing_unit_technology, "optical-fiber")

local solar_panel = data.raw.recipe["solar-panel"]
replaceIngredient(solar_panel, "copper-plate", silicon_wafer_item.name)

local electronics = data.raw.technology["electronics"]
lockRecipe(electronics, silicon_wafer_recipe.name)
lockRecipe(electronics, "electronic-circuit")