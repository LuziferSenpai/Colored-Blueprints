require "config"
require "util"

local MODNAME = "__colored_blueprints__"

data:extend
{
	{ type = "item-group", name = "colored-blueprints", icon = MODNAME .. "/graphics/icon.png", icon_size = 64, order = "gg" },
	{ type = "item-subgroup", name = "colored-blueprint", group = "colored-blueprints", order = "a" },
	{ type = "item-subgroup", name = "colored-book", group = "colored-blueprints", order = "b" }
}

local Order = 0
local Placeholder = ""
local color_vanilla = "#1A78AB"

data.raw["blueprint"]["blueprint"].icon = nil
data.raw["blueprint"]["blueprint"].icon_size = nil
data.raw["blueprint"]["blueprint"].icon_mimap = nil
data.raw["blueprint"]["blueprint"].icons =
{
	{ icon = MODNAME .. "/graphics/blueprint-base.png", icon_size = 32 },
	{ icon = MODNAME .. "/graphics/blueprint-mask.png", icon_size = 32, tint = util.color( color_vanilla ) }
}
data.raw["blueprint"]["blueprint"].localised_name = { "colored.colored-blueprints", color_vanilla }

data.raw["blueprint-book"]["blueprint-book"].icon = nil
data.raw["blueprint-book"]["blueprint-book"].icon_size = nil
data.raw["blueprint-book"]["blueprint-book"].icon_mimap = nil
data.raw["blueprint-book"]["blueprint-book"].icons =
{
	{ icon = MODNAME .. "/graphics/blueprint-book-base.png", icon_size = 32 },
	{ icon = MODNAME .. "/graphics/blueprint-book-mask.png", icon_size = 32, tint = util.color( color_vanilla ) }
}
data.raw["blueprint-book"]["blueprint-book"].localised_name = { "colored.colored-books", color_vanilla }

for HEX, _ in pairs( Senpais.BookColors ) do
	if Order < 10 then Placeholder = "0" else Placeholder = "" end
	Order = Order + 1

	local newblueprint = util.table.deepcopy( data.raw["blueprint"]["blueprint"] )
	newblueprint.name = HEX .. "-colored-blueprint"
	newblueprint.icon = nil
	newblueprint.icon_size = nil
	newblueprint.icon_mimap = nil
	newblueprint.icons =
	{
		{ icon = MODNAME .. "/graphics/blueprint-base.png", icon_size = 32 },
		{ icon = MODNAME .. "/graphics/blueprint-mask.png", icon_size = 32, tint = util.color( HEX ) }
	}
	newblueprint.subgroup = "colored-blueprint"
	newblueprint.order = "print-" .. Placeholder .. Order
	newblueprint.localised_name = { "colored.colored-blueprints", HEX }
	newblueprint.localised_description = { "item.description.blueprint" }

	local newblueprintrecipe =
	{
		type = "recipe",
		name = HEX .. "-colored-blueprint",
		ingredients = {},
		result = HEX .. "-colored-blueprint"
	}

	local newblueprintbook = util.table.deepcopy( data.raw["blueprint-book"]["blueprint-book"] )
	newblueprintbook.name = HEX .. "-colored-book"
	newblueprintbook.icon = nil
	newblueprintbook.icon_size = nil
	newblueprintbook.icon_mimap = nil
	newblueprintbook.icons =
	{
		{ icon = MODNAME .. "/graphics/blueprint-book-base.png", icon_size = 32 },
		{ icon = MODNAME .. "/graphics/blueprint-book-mask.png", icon_size = 32, tint = util.color( HEX ) }
	}
	newblueprintbook.subgroup = "colored-book"
	newblueprintbook.order = "book-" .. Placeholder .. Order
	newblueprintbook.localised_name = { "colored.colored-books", HEX }
	
	local newblueprintbookrecipe =
	{
		type = "recipe",
		name = HEX .. "-colored-book",
		ingredients = {},
		result = HEX .. "-colored-book"
	}

	data:extend{ newblueprint, newblueprintrecipe, newblueprintbook, newblueprintbookrecipe }
end