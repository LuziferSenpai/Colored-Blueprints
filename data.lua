require "config"
require "util"

local m = "__colored_blueprints__"

data:extend
{
	{ type = "item-group", name = "colored-blueprints", icon = m .. "/graphics/icon.png", icon_size = 64, order = "gg" },
	{ type = "item-subgroup", name = "colored-blueprint", group = "colored-blueprints", order = "a" },
	{ type = "item-subgroup", name = "colored-book", group = "colored-blueprints", order = "b" }
}

local n = {}
local o = 0

local color_vanilla = "#1A78AB"

data.raw["blueprint"]["blueprint"].icon = nil
data.raw["blueprint"]["blueprint"].icon_size = nil
data.raw["blueprint"]["blueprint"].icon_mimap = nil
data.raw["blueprint"]["blueprint"].icons =
{
	{ icon = m .. "/graphics/blueprint-base.png", icon_size = 32 },
	{ icon = m .. "/graphics/blueprint-mask.png", icon_size = 32, tint = util.color( color_vanilla ) }
}
data.raw["blueprint"]["blueprint"].localised_name = { "colored.colored-blueprints", color_vanilla }

data.raw["blueprint-book"]["blueprint-book"].icon = nil
data.raw["blueprint-book"]["blueprint-book"].icon_size = nil
data.raw["blueprint-book"]["blueprint-book"].icon_mimap = nil
data.raw["blueprint-book"]["blueprint-book"].icons =
{
	{ icon = m .. "/graphics/blueprint-book-base.png", icon_size = 32 },
	{ icon = m .. "/graphics/blueprint-book-mask.png", icon_size = 32, tint = util.color( color_vanilla ) }
}
data.raw["blueprint-book"]["blueprint-book"].localised_name = { "colored.colored-books", color_vanilla }

--local s = settings.startup["new-colors"].value

local Colors = {}

--[[if s ~= "" then
	forword in string.gmatch( s, "#[0-9a-fA-F]+" ) do log( word ) end
end]]

for h, _ in pairs( Senpais.BookColors ) do
	Colors[h] = true
end

for h, _ in pairs( Colors ) do
	if o < 10 then p = "0" else p = "" end
	o = o + 1

	local np = util.table.deepcopy( data.raw["blueprint"]["blueprint"] )
	np.name = h .. "-colored-blueprint"
	np.icon = nil
	np.icon_size = nil
	np.icon_mimap = nil
	np.icons =
	{
		{ icon = m .. "/graphics/blueprint-base.png", icon_size = 32 },
		{ icon = m .. "/graphics/blueprint-mask.png", icon_size = 32, tint = util.color( h ) }
	}
	np.subgroup = "colored-blueprint"
	np.order = "print-" .. p .. o
	np.localised_name = { "colored.colored-blueprints", h }
	np.localised_description = { "item.description.blueprint" }

	local nb = util.table.deepcopy( data.raw["blueprint-book"]["blueprint-book"] )
	nb.name = h .. "-colored-book"
	nb.icon = nil
	nb.icon_size = nil
	nb.icon_mimap = nil
	nb.icons =
	{
		{ icon = m .. "/graphics/blueprint-book-base.png", icon_size = 32 },
		{ icon = m .. "/graphics/blueprint-book-mask.png", icon_size = 32, tint = util.color( h ) }
	}
	nb.subgroup = "colored-book"
	nb.order = "book-" .. p .. o
	nb.localised_name = { "colored.colored-books", h }
	
	data:extend{ np, nb }
end