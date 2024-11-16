function indexOf(array, pred)
    for i, v in ipairs(array) do
        if pred(v) then
            return i
        end
    end
    error("failed to find value in array")
end

function hasName(name)
    return function(e)
        return e.name == name
    end
end

function modifyIngredient(recipe, ingredientName, callback)
    local index = indexOf(recipe.ingredients, hasName(ingredientName))
    callback(recipe.ingredients[index])
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
    local index = indexOf(recipe.results, hasName(resultName))
    callback(recipe.results[index])
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

function lockRecipe(technology, recipeName)
    local index = indexOf(technology.effects, function(e)
        return e.type == "unlock-recipe" and e.recipe == recipeName
    end)
    table.remove(technology.effects, index)
end