require "config"
require "util"

local MODNAME = "__colored_blueprints__"
local table_deepcopy = util.table.deepcopy

data:extend {
    {type = "item-group", name = "colored-blueprints", icon = MODNAME .. "/graphics/icon.png", icon_size = 64, order = "gg"},
    {type = "item-subgroup", name = "colored-blueprint", group = "colored-blueprints", order = "a"},
    {type = "item-subgroup", name = "colored-book", group = "colored-blueprints", order = "b"}
}

local order = 0
local placeholder = ""
local color_vanilla = "#1A78AB"

data.raw["blueprint"]["blueprint"].icon = nil
data.raw["blueprint"]["blueprint"].icon_size = nil
data.raw["blueprint"]["blueprint"].icon_mimap = nil
data.raw["blueprint"]["blueprint"].icons = {
    {icon = MODNAME .. "/graphics/blueprint-base.png", icon_size = 32},
    {icon = MODNAME .. "/graphics/blueprint-mask.png", icon_size = 32, tint = util.color(color_vanilla)}
}
data.raw["blueprint"]["blueprint"].localised_name = {"colored.colored-blueprints", color_vanilla}

data.raw["blueprint-book"]["blueprint-book"].icon = nil
data.raw["blueprint-book"]["blueprint-book"].icon_size = nil
data.raw["blueprint-book"]["blueprint-book"].icon_mimap = nil
data.raw["blueprint-book"]["blueprint-book"].icons = {
    {icon = MODNAME .. "/graphics/blueprint-book-base.png", icon_size = 32},
    {icon = MODNAME .. "/graphics/blueprint-book-mask.png", icon_size = 32, tint = util.color(color_vanilla)}
}
data.raw["blueprint-book"]["blueprint-book"].localised_name = {"colored.colored-books", color_vanilla}

for hex, _ in pairs(Senpais.BookColors) do
    placeholder = (order < 10 and "0") or ""
    order = order + 1

    local newblueprint = table_deepcopy(data.raw["blueprint"]["blueprint"])
    newblueprint.name = hex .. "-colored-blueprint"
    newblueprint.icon = nil
    newblueprint.icon_size = nil
    newblueprint.icon_mimap = nil
    newblueprint.icons = {
        {icon = MODNAME .. "/graphics/blueprint-base.png", icon_size = 32},
        {icon = MODNAME .. "/graphics/blueprint-mask.png", icon_size = 32, tint = util.color(hex)}
    }
    newblueprint.subgroup = "colored-blueprint"
    newblueprint.order = "print-" .. placeholder .. order
    newblueprint.localised_name = {"colored.colored-blueprints", hex}
    newblueprint.localised_description = {"item.description.blueprint"}

    local newblueprintrecipe = {
        type = "recipe",
        name = hex .. "-colored-blueprint",
        ingredients = {},
        result = hex .. "-colored-blueprint"
    }

    local newblueprintbook = table_deepcopy(data.raw["blueprint-book"]["blueprint-book"])
    newblueprintbook.name = hex .. "-colored-book"
    newblueprintbook.icon = nil
    newblueprintbook.icon_size = nil
    newblueprintbook.icon_mimap = nil
    newblueprintbook.icons = {
        {icon = MODNAME .. "/graphics/blueprint-book-base.png", icon_size = 32},
        {icon = MODNAME .. "/graphics/blueprint-book-mask.png", icon_size = 32, tint = util.color(hex)}
    }
    newblueprintbook.subgroup = "colored-book"
    newblueprintbook.order = "book-" .. placeholder .. order
    newblueprintbook.localised_name = {"colored.colored-books", hex}

    local newblueprintbookrecipe = {
        type = "recipe",
        name = hex .. "-colored-book",
        ingredients = {},
        result = hex .. "-colored-book"
    }

    data:extend{newblueprint, newblueprintrecipe, newblueprintbook, newblueprintbookrecipe}
end