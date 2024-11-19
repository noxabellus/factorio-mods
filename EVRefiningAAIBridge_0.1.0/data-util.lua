function indexOf(array, pred)
    if array then
        for i, v in ipairs(array) do
            if pred(v) then
                return i
            end
        end
    end
    
    return nil
end

function hasName(name)
    return function(e)
        return e.name == name
    end
end

function isEqual(name)
    return function(e)
        return e == name
    end
end

function modifyIngredient(recipe, ingredientName, callback)
    local index = assert(indexOf(recipe.ingredients, hasName(ingredientName)))
    callback(recipe.ingredients[index])
end

function removeIngredient(recipe, ingredientName, optional)
    local index = nil
    if recipe then
        index = indexOf(recipe.ingredients, hasName(ingredientName))
    end
    if not optional then assert(index)
    elseif not index then return end
    table.remove(recipe.ingredients, index)
end

function replaceIngredient(recipe, oldName, newName, newAmount)
    modifyIngredient(recipe, oldName, function(ingredient)
        ingredient.name = newName
        if newAmount ~= nil then
            ingredient.amount = newAmount
        end
    end)
end

function addIngredient(recipe, ingredientName, ingredientAmount)
    table.insert(recipe.ingredients, { type = "item", name = ingredientName, amount = ingredientAmount })
end

function modifyResult(recipe, resultName, callback)
    local index = assert(indexOf(recipe.results, hasName(resultName)))
    callback(recipe.results[index])
end

function removeResult(recipe, resultName, optional)
    local index = nil
    if recipe then
        index = indexOf(recipe.results, hasName(resultName))
    end
    if not optional then assert(index)
    elseif not index then return end
    table.remove(recipe.results, index)
end

function replaceResult(recipe, oldName, newName, newAmount)
    modifyResult(recipe, oldName, function(result)
        result.name = newName
        if newAmount ~= nil then
            result.amount = newAmount
        end
    end)
end

function addResult(recipe, resultName, resultAmount)
    table.insert(recipe.results, { type = "item", name = resultName, amount = resultAmount })
end

function unlockRecipe(technology, recipeName)
    table.insert(technology.effects, { type = "unlock-recipe", recipe = recipeName })
end

function lockRecipe(technology, recipeName, optional)
    local index = nil
    if technology then
        index = indexOf(technology.effects, function(e)
            return e.type == "unlock-recipe" and e.recipe == recipeName
        end)
    end
    if not optional then assert(index)
    elseif not index then return end
    table.remove(technology.effects, index)
end

function removePrerequisite(technology, previousTechnologyName, optional)
    local index = nil
    if technology then
        index = indexOf(technology.prerequisites, isEqual(previousTechnologyName))
    end
    if not optional then assert(index)
    elseif not index then return end
    table.remove(technology.prerequisites, index)
end

function addTechIngredient(technology, ingredientName, ingredientAmount)
    table.insert(technology.unit.ingredients, { ingredientName, ingredientAmount })
end

function removeTechIngredient(technology, ingredientName, optional)
    local index = nil
    if technology and technology.unit then
        index = indexOf(technology.unit.ingredients, function (e)
            return e[1] == ingredientName
        end)
    end
    if not optional then assert(index)
    elseif not index then return end
    table.remove(technology.unit.ingredients, index)
end