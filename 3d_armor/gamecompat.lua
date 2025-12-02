-- 3d_armor defaults to support unknown games
local sounds = {
	wood = {
		footstep = { name = "armor_wood_walk", gain = 0.5 },
		dig = { name = "armor_wood_dig", gain = 0.5 },
		dug = { name = "armor_wood_walk", gain = 0.5 }
	},
	metal = {
		dig = { name = "armor_metal_dig", gain = 0.5 },
		dug = { name = "armor_metal_break", gain = 0.5 },
	},
	glass = {
		dig = { name = "armor_glass_hit", gain = 0.5 },
		dug = { name = "armor_glass_break", gain = 0.5 },
	},
}

local formspec_list_template = "list[%s;%s;%f,%f;%f,%f;%s]"
-- Allow custom slot styling
armor.add_formspec_list = function(location, listname, x, y, w, h, offset)
	return formspec_list_template:format(location, listname, x, y, w, h, tostring(offset) or "")
end


if core.get_modpath("default") then
	sounds = {
		wood  = default.node_sound_wood_defaults(),
		metal = default.node_sound_metal_defaults(),
		glass = default.node_sound_glass_defaults(),
	}
	-- armor.add_formspec_list : use formspec prepends for styling
end


-- Sanity checks
for name, def in pairs(sounds) do
	assert(type(def) == "table", "Incorrect registration of sound " .. name)
end


armor.sounds = sounds
