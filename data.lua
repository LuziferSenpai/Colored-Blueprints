require( "config" )

data:extend
{
 { type = "item-group", name = "colored-blueprints", icon = MODNAME .. "/graphics/icon.png", icon_size = 64, order = "gg" },
 { type = "item-subgroup", name = "colored-blueprint", group = "colored-blueprints", order = "a" },
 { type = "item-subgroup", name = "colored-book", group = "colored-blueprints", order = "b" }
}

local new_items = {}
local new_recipes = {}
local ordernumber = 0

for color, blank in pairs( BLUEPRINT_COLOR ) do
	if ordernumber < 10 then pad = "0" else pad = "" end
	ordernumber = ordernumber + 1

	local new_print = util.table.deepcopy( data.raw["blueprint"]["blueprint"] )
	new_print.name = color .. "-blueprint"
	new_print.icon = MODNAME .. "/graphics/" .. color .. "-blueprint.png"
	new_print.subgroup = "colored-blueprint"
	new_print.order = "print-" .. pad .. ordernumber
	new_print.localised_name = {"item-name.colored-blueprints", { color } }

	table.insert( new_items, new_print )

	local new_book = util.table.deepcopy( data.raw["blueprint-book"]["blueprint-book"] )
	new_book.name = color .. "-book"
	new_book.icon = MODNAME .. "/graphics/" .. color .. "-book.png"
	new_book.subgroup = "colored-book"
	new_book.order = "book-" .. pad .. ordernumber
	new_book.localised_name = {"item-name.colored-books", { color } }

	table.insert( new_items, new_book )
end

for i = 1, #new_items do
	data:extend( { new_items[i] } )
end