-- support for i18n
local S = minetest.get_translator(minetest.get_current_modname())

local armor_stand_formspec = "size[8,7]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	default.get_hotbar_bg(0,3) ..
	"list[current_name;main;3,0.5;2,1;]" ..
	"list[current_name;main;3,1.5;2,1;2]" ..
	"image[3,0.5;1,1;3d_armor_stand_head.png]" ..
	"image[4,0.5;1,1;3d_armor_stand_torso.png]" ..
	"image[3,1.5;1,1;3d_armor_stand_legs.png]" ..
	"image[4,1.5;1,1;3d_armor_stand_feet.png]" ..
	"list[current_player;main;0,3;8,1;]" ..
	"list[current_player;main;0,4.25;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]"

local elements = {"head", "torso", "legs", "feet"}

local function drop_armor(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	for i = 1, 4 do
		local stack = inv:get_stack("main", i)
		if stack and stack:get_count() > 0 then
			armor.drop_armor(pos, stack)
			inv:set_stack("main", i, nil)
		end
	end
end

local function get_stand_object(pos)
	local object = nil
	local objects = minetest.get_objects_inside_radius(pos, 0.5) or {}
	for _, obj in pairs(objects) do
		local ent = obj:get_luaentity()
		if ent then
			if ent.name == "3d_armor_stand:armor_entity" then
				-- Remove duplicates
				if object then
					obj:remove()
				else
					object = obj
				end
			end
		end
	end
	return object
end

local function update_entity(pos)
	local node = minetest.get_node(pos)
	local object = get_stand_object(pos)
	if object then
		if not string.find(node.name, "3d_armor_stand:") then
			object:remove()
			return
		end
	else
		object = minetest.add_entity(pos, "3d_armor_stand:armor_entity")
	end
	if object then
		local texture = "blank.png"
		local textures = {}
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local yaw = 0
		if inv then
			for i, element in ipairs(elements) do
				local stack = inv:get_stack("main", i)
				if stack:get_count() == 1 then
					local item = stack:get_name() or ""
					local def = stack:get_definition() or {}
					local groups = def.groups or {}
					if groups["armor_"..element] then
						if def.texture then
							table.insert(textures, def.texture)
						else
							table.insert(textures, item:gsub("%:", "_")..".png")
						end
					end
				end
			end
		end
		if #textures > 0 then
			texture = table.concat(textures, "^")
		end
		if node.param2 then
			local rot = node.param2 % 4
			if rot == 1 then
				yaw = 3 * math.pi / 2
			elseif rot == 2 then
				yaw = math.pi
			elseif rot == 3 then
				yaw = math.pi / 2
			end
		end
		object:set_yaw(yaw)
		object:set_properties({textures={texture}})
	end
end

local function has_locked_armor_stand_privilege(meta, player)
	local name = ""
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
		name = player:get_player_name()
	end
	if name ~= meta:get_string("owner") then
		return false
	end
	return true
end

local function add_hidden_node(pos, player)
	local p = {x=pos.x, y=pos.y + 1, z=pos.z}
	local name = player:get_player_name()
	local node = minetest.get_node(p)
	if node.name == "air" and not minetest.is_protected(pos, name) then
		minetest.set_node(p, {name="3d_armor_stand:top"})
	end
end

local function remove_hidden_node(pos)
	local p = {x=pos.x, y=pos.y + 1, z=pos.z}
	local node = minetest.get_node(p)
	if node.name == "3d_armor_stand:top" then
		minetest.remove_node(p)
	end
end

minetest.register_node("3d_armor_stand:top", {
	description = S("Armor Stand Top"),
	paramtype = "light",
	drawtype = "plantlike",
	sunlight_propagates = true,
	walkable = true,
	pointable = false,
	diggable = false,
	buildable_to = false,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	is_ground_content = false,
	on_blast = function() end,
	tiles = {"blank.png"},
})

local function register_armor_stand(def)
	local function owns_armor_stand(pos, meta, player)
		if def.name == "locked_armor_stand" and not has_locked_armor_stand_privilege(meta, player) then
			return false
		end
		local has_access = minetest.is_player(player) and not minetest.is_protected(pos, player:get_player_name())
		if def.name == "shared_armor_stand" and not has_access then
			return false
		end
		return true
	end

	minetest.register_node("3d_armor_stand:" .. def.name, {
		description = def.description,
		drawtype = "mesh",
		mesh = "3d_armor_stand.obj",
		tiles = {def.texture},
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.4375, -0.25, 0.25, 1.4, 0.25},
				{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			},
		},
		groups = {choppy=2, oddly_breakable_by_hand=2},
		is_ground_content = false,
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", armor_stand_formspec)
			meta:set_string("infotext", def.description)
			if def.name == "locked_armor_stand" then
				meta:set_string("owner", "")
			end
			local inv = meta:get_inventory()
			inv:set_size("main", 4)
		end,
		can_dig = function(pos, player)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if not inv:is_empty("main") then
				return false
			end
			return true
		end,
		after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			minetest.add_entity(pos, "3d_armor_stand:armor_entity")
			if def.name == "locked_armor_stand" then
				meta:set_string("owner", placer:get_player_name() or "")
				meta:set_string("infotext", S("Armor Stand (owned by @1)", meta:get_string("owner")))
			elseif def.name == "shared_armor_stand" then
				meta:set_string("infotext", def.description)
			end
			add_hidden_node(pos, placer)
		end,
		allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if not owns_armor_stand(pos, meta, player) then
				return 0
			end
			local inv = meta:get_inventory()
			local stack_def = stack:get_definition() or {}
			local groups = stack_def.groups or {}
			for i, element in ipairs(elements) do
				if groups["armor_"..element] and inv:get_stack(listname, i):is_empty() then
					return 1
				end
			end
			return 0
		end,
		allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			local meta = minetest.get_meta(pos)
			if not owns_armor_stand(pos, meta, player) then
				return 0
			end
			return 1
		end,
		allow_metadata_inventory_move = function(pos)
			return 0
		end,
		on_metadata_inventory_put = function(pos, listname, index, stack)
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			local stack_def = stack:get_definition() or {}
			local groups = stack_def.groups or {}
			for i, element in ipairs(elements) do
				if groups["armor_"..element] then
					inv:set_stack(listname, i, stack)
					if index ~= i then
						inv:set_stack(listname, index, nil)
					end
					break
				end
			end
			update_entity(pos)
		end,
		on_metadata_inventory_take = function(pos)
			update_entity(pos)
		end,
		after_destruct = function(pos)
			update_entity(pos)
			remove_hidden_node(pos)
		end,
		on_blast = def.on_blast
	})
end

register_armor_stand({
	name = "armor_stand",
	description = S("Armor Stand"),
	texture = "3d_armor_stand.png",
	on_blast = function(pos)
		drop_armor(pos)
		armor.drop_armor(pos, "3d_armor_stand:armor_stand")
		minetest.remove_node(pos)
	end
})

register_armor_stand({
	name = "locked_armor_stand",
	description = S("Locked Armor Stand"),
	texture = "3d_armor_stand_locked.png"
})

register_armor_stand({
	name = "shared_armor_stand",
	description = S("Shared Armor Stand"),
	texture = "3d_armor_stand_shared.png"
})

minetest.register_entity("3d_armor_stand:armor_entity", {
	initial_properties = {
		physical = true,
		visual = "mesh",
		mesh = "3d_armor_entity.obj",
		visual_size = {x=1, y=1},
		collisionbox = {0,0,0,0,0,0},
		textures = {"blank.png"},
	},
	_pos = nil,
	on_activate = function(self)
		local pos = self.object:get_pos()
		if pos then
			self._pos = vector.round(pos)
			update_entity(pos)
		end
	end,
	on_blast = function(self, damage)
		local drops = {}
		local node = minetest.get_node(self._pos)
		if node.name == "3d_armor_stand:armor_stand" then
			drop_armor(self._pos)
			self.object:remove()
		end
		return false, false, drops
	end,
})

minetest.register_abm({
	nodenames = {"3d_armor_stand:locked_armor_stand", "3d_armor_stand:shared_armor_stand", "3d_armor_stand:armor_stand"},
	interval = 15,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local num
		num = #minetest.get_objects_inside_radius(pos, 0.5)
		if num > 0 then return end
		update_entity(pos)
	end
})

minetest.register_lbm({
	label = "Update armor stand inventories",
	name = "3d_armor_stand:update_inventories",
	nodenames = {"3d_armor_stand:locked_armor_stand", "3d_armor_stand:shared_armor_stand", "3d_armor_stand:armor_stand"},
	run_at_every_load = false,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local lists = inv:get_lists()
		for _, element in pairs(elements) do
			if not lists["armor_"..element] then
				-- Abort to avoid item loss in case env_meta.txt is corrupted/deleted
				return
			end
		end
		inv:set_lists({main = {
			lists.armor_head[1],
			lists.armor_torso[1],
			lists.armor_legs[1],
			lists.armor_feet[1]
		}})
		meta:set_string("formspec", armor_stand_formspec)
		update_entity(pos)
	end
})

minetest.register_craft({
	output = "3d_armor_stand:armor_stand",
	recipe = {
		{"", "group:fence", ""},
		{"", "group:fence", ""},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "3d_armor_stand:locked_armor_stand",
	recipe = {
		{"3d_armor_stand:armor_stand", "default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "3d_armor_stand:shared_armor_stand",
	recipe = {
		{"3d_armor_stand:armor_stand", "default:copper_ingot"},
	}
})
