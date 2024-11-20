require "./data-util.lua"


-- sand changes --

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

local sand_processing = data.raw.technology["sand-processing"]
unlockRecipe(sand_processing, "craft-sand-to-fine")

local base_ore_processing = data.raw.technology["base-ore-processing"]
unlockRecipe(base_ore_processing, "gravel-to-sand")
unlockRecipe(base_ore_processing, "grind-sand-to-fine")

local advanced_ore_processing = data.raw.technology["advanced-ore-processing"]
lockRecipe(advanced_ore_processing, "gravel-to-sand")
unlockRecipe(advanced_ore_processing, "gravel-to-sand-2")


-- silicon addition --

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


-- force ev refining to be a pure-nauvis tech tree --

local advanced_ore_processing = data.raw.technology["advanced-ore-processing"]
removePrerequisite(advanced_ore_processing, "metallurgic-science-pack")
removeTechIngredient(advanced_ore_processing, "metallurgic-science-pack")

local advanced_coal_processing = data.raw.technology["advanced-coal-processing"]
removePrerequisite(advanced_coal_processing, "metallurgic-science-pack")
removeTechIngredient(advanced_coal_processing, "metallurgic-science-pack")

local coal_enriching = data.raw.technology["coal-enriching"]
removePrerequisite(coal_enriching, "metallurgic-science-pack")
removeTechIngredient(coal_enriching, "metallurgic-science-pack")

local elite_ore_processing = data.raw.technology["elite-ore-processing"]
removePrerequisite(elite_ore_processing, "electromagnetic-science-pack")
removeTechIngredient(elite_ore_processing, "metallurgic-science-pack")
removeTechIngredient(elite_ore_processing, "electromagnetic-science-pack")

local ultimate_ore_processing = data.raw.technology["ultimate-ore-processing"]
removePrerequisite(ultimate_ore_processing, "space-science-pack")
removePrerequisite(ultimate_ore_processing, "agricultural-science-pack")
removeTechIngredient(ultimate_ore_processing, "space-science-pack")
removeTechIngredient(ultimate_ore_processing, "metallurgic-science-pack")
removeTechIngredient(ultimate_ore_processing, "agricultural-science-pack")
removeTechIngredient(ultimate_ore_processing, "electromagnetic-science-pack")

local ore_crushing_productivity = data.raw.technology["ore-crushing-productivity"]
removePrerequisite(ore_crushing_productivity, "metallurgic-science-pack")
removeTechIngredient(ore_crushing_productivity, "metallurgic-science-pack")
addTechIngredient(ore_crushing_productivity, "utility-science-pack", 1)
ore_crushing_productivity.unit.count_formula = "1.5^L*1000"
ore_crushing_productivity.unit.count = nil
ore_crushing_productivity.unit.time = 60
ore_crushing_productivity.max_level = "infinite"
ore_crushing_productivity.upgrade = true

local ore_enriching_productivity = data.raw.technology["ore-enriching-productivity"]
removePrerequisite(ore_enriching_productivity, "electromagnetic-science-pack")
removePrerequisite(ore_enriching_productivity, "ore-crushing-productivity")
removeTechIngredient(ore_enriching_productivity, "electromagnetic-science-pack")
removeTechIngredient(ore_enriching_productivity, "metallurgic-science-pack")
addTechIngredient(ore_enriching_productivity, "utility-science-pack", 1)
ore_enriching_productivity.unit.count_formula = "1.5^L*1000"
ore_enriching_productivity.unit.count = nil
ore_enriching_productivity.unit.time = 60
ore_enriching_productivity.max_level = "infinite"
ore_enriching_productivity.upgrade = true

local crusher2 = data.raw.recipe["crusher2"]
replaceIngredient(crusher2, "tungsten-plate", "steel-plate", 12)
replaceIngredient(crusher2, "tungsten-carbide", "low-density-structure", 12)

local crusher3 = data.raw.recipe["crusher3"]
replaceIngredient(crusher3, "productivity-module-2", "productivity-module", 4)
replaceIngredient(crusher3, "efficiency-module-2", "efficiency-module", 4)
replaceIngredient(crusher3, "speed-module-2", "speed-module", 4)

local echamber1 = data.raw.recipe["echamber1"]
replaceIngredient(echamber1, "tungsten-plate", "electronic-circuit", 12)

local echamber2 = data.raw.recipe["echamber2"]
replaceIngredient(echamber2, "superconductor", "steel-plate", 12)
replaceIngredient(echamber2, "supercapacitor", "low-density-structure", 12)

local echamber3 = data.raw.recipe["echamber3"]
replaceIngredient(echamber3, "productivity-module-2", "productivity-module", 4)
replaceIngredient(echamber3, "efficiency-module-2", "efficiency-module", 4)
replaceIngredient(echamber3, "speed-module-2", "speed-module", 4)

local pchamber1 = data.raw.recipe["pchamber1"]
replaceIngredient(pchamber1, "holmium-plate", "processing-unit", 12)

local pchamber2 = data.raw.recipe["pchamber2"]
replaceIngredient(pchamber2, "productivity-module-3", "productivity-module", 12)
replaceIngredient(pchamber2, "speed-module-3", "speed-module", 12)


-- a few of the techs have unnecessary dependency on coal liquefaction, which is moved in space age --

for k, tech in pairs(data.raw.technology) do
    removePrerequisite(tech, "coal-liquefaction", true) -- true means this is an optional removal, does not error if the prerequisite doesn't exist
end


-- remove space science dependency for logistics techs --

for k, v in pairs(data.raw.technology) do
    if k:find("logistic") then
        removePrerequisite(v, "space-science-pack", true)
        removeTechIngredient(v, "space-science-pack", true)
    end
end


-- make auto-barrel tiny --

local barreling_machine = assert(data.raw.furnace["barreling-machine"])
local unbarreling_machine = assert(data.raw.furnace["unbarreling-machine"])
local scale = 1/3

function scaleNumber(point)
    return point * scale
end

function scalePoint(point)
    return { scaleNumber(point[1]), scaleNumber(point[2]) }
end

function scaleCoord(coord)
    return { x = scaleNumber(coord.x), y = scaleNumber(coord.y) }
end

function scaleBox(box)
    return {
        scalePoint(box[1]),
        scalePoint(box[2])
    }
end

function scaleMachine(machine)
    machine.collision_box = scaleBox(machine.collision_box)
    machine.selection_box = scaleBox(machine.selection_box)

    for i, v in ipairs(machine.graphics_set.animation.layers) do
        v.scale = 0.185
        v.shift = scalePoint(v.shift)
    end

    for i, v in ipairs(machine.graphics_set.working_visualisations) do
        v.north_position = scaleCoord(v.north_position)
        v.east_position = scaleCoord(v.east_position)
        v.south_position = scaleCoord(v.south_position)
        v.west_position = scaleCoord(v.west_position)
    end
end

barreling_machine.crafting_speed = 8
barreling_machine.module_slots = 0
barreling_machine.fluid_boxes[1].pipe_connections[1].position = {0, -0.15}
scaleMachine(barreling_machine)

unbarreling_machine.crafting_speed = 8
unbarreling_machine.module_slots = 0
unbarreling_machine.fluid_boxes[1].pipe_connections[1].position = {0, 0.15}
scaleMachine(unbarreling_machine)
