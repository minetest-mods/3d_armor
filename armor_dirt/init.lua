
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator

--- Dirt
--
--  Requires setting `armor_material_dirt`.
--
--  @section dirt

if armor.materials.dirt then
	--- Dirt Helmet
	--
	--  @helmet 3d_armor:helmet_dirt
	--  @img 3d_armor_inv_helmet_dirt.png
	--  @grp armor_head 1
	--  @grp armor_heal 0
	--  @grp armor_use 1500
	--  @grp flammable 1
	--  @armorgrp fleshy 5
	--  @damagegrp cracky 4
	--  @damagegrp snappy 3
	--  @damagegrp choppy 4
	--  @damagegrp crumbly 3
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:helmet_dirt", {
		description = S("Dirt Helmet"),
		inventory_image = "3d_armor_inv_helmet_dirt.png",
		groups = {armor_head=1, armor_heal=0, armor_use=1500, flammable=1},
		armor_groups = {fleshy=5},
		damage_groups = {cracky=4, snappy=3, choppy=4, crumbly=3, level=1},
	})
	--- Dirt Chestplate
	--
	--  @chestplate 3d_armor:chestplate_dirt
	--  @img 3d_armor_inv_chestplate_dirt.png
	--  @grp armor_torso 1
	--  @grp armor_heal 0
	--  @grp armor_use 1500
	--  @grp flammable 1
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 4
	--  @damagegrp snappy 3
	--  @damagegrp choppy 4
	--  @damagegrp crumbly 3
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:chestplate_dirt", {
		description = S("Dirt Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_dirt.png",
		groups = {armor_torso=1, armor_heal=0, armor_use=1500, flammable=1},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=4, snappy=3, choppy=4, crumbly=3, level=1},
	})
	--- Dirt Leggings
	--
	--  @leggings 3d_armor:leggings_dirt
	--  @img 3d_armor_inv_leggings_dirt.png
	--  @grp armor_legs 1
	--  @grp armor_heal 0
	--  @grp armor_use 1500
	--  @grp flammable 1
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 4
	--  @damagegrp snappy 3
	--  @damagegrp choppy 4
	--  @damagegrp crumbly 3
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:leggings_dirt", {
		description = S("Dirt Leggings"),
		inventory_image = "3d_armor_inv_leggings_dirt.png",
		groups = {armor_legs=1, armor_heal=0, armor_use=1500, flammable=1},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=4, snappy=3, choppy=4, crumbly=3, level=1},
	})
	--- Dirt Boots
	--
	--  @boots 3d_armor:boots_dirt
	--  @img 3d_armor_inv_boots_dirt.png
	--  @grp armor_feet 1
	--  @grp armor_heal 0
	--  @grp armor_use 1500
	--  @grp flammable 1
	--  @armorgrp fleshy 5
	--  @damagegrp cracky 4
	--  @damagegrp snappy 3
	--  @damagegrp choppy 4
	--  @damagegrp crumbly 3
	--  @damagegrp level 1
	armor:register_armor(":3d_armor:boots_dirt", {
		description = S("Dirt Boots"),
		inventory_image = "3d_armor_inv_boots_dirt.png",
		armor_groups = {fleshy=5},
		damage_groups = {cracky=4, snappy=3, choppy=4, crumbly=3, level=1},
		groups = {armor_feet=1, armor_heal=0, armor_use=1500, flammable=1},
	})
	local dirt_armor_fuel = {
		helmet = 5,
		chestplate = 7,
		leggings = 6,
		boots = 4
	}
	for armor, burn in pairs(dirt_armor_fuel) do
		minetest.register_craft({
			type = "fuel",
			recipe = "3d_armor:" .. armor .. "_dirt",
			burntime = burn,
		})
	end

	--- Crafting
	--
	--  @section craft

	--- Craft recipes for helmets, chestplates, leggings, boots, & shields.
	--
	--  @craft armor
	--  @usage
	--  Key:
	--  - m: material
	--    - dirt:    group:dirt
	--    - cactus:  default:cactus
	--    - steel:   default:steel_ingot
	--    - bronze:  default:bronze_ingot
	--    - diamond: default:diamond
	--    - gold:    default:gold_ingot
	--    - mithril: moreores:mithril_ingot
	--    - crystal: ethereal:crystal_ingot
	--    - nether:  nether:nether_ingot
	--
	--  helmet:        chestplate:    leggings:
	--  ┌───┬───┬───┐  ┌───┬───┬───┐  ┌───┬───┬───┐
	--  │ m │ m │ m │  │ m │   │ m │  │ m │ m │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤  ├───┼───┼───┤
	--  │ m │   │ m │  │ m │ m │ m │  │ m │   │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤  ├───┼───┼───┤
	--  │   │   │   │  │ m │ m │ m │  │ m │   │ m │
	--  └───┴───┴───┘  └───┴───┴───┘  └───┴───┴───┘
	--
	--  boots:         shield:
	--  ┌───┬───┬───┐  ┌───┬───┬───┐
	--  │   │   │   │  │ m │ m │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤
	--  │ m │   │ m │  │ m │ m │ m │
	--  ├───┼───┼───┤  ├───┼───┼───┤
	--  │ m │   │ m │  │   │ m │   │
	--  └───┴───┴───┘  └───┴───┴───┘

	local s = "dirt"
	local m = armor.materials.dirt
	minetest.register_craft({
		output = "3d_armor:helmet_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "3d_armor:chestplate_"..s,
		recipe = {
			{m, "", m},
			{m, m, m},
			{m, m, m},
		},
	})
	minetest.register_craft({
		output = "3d_armor:leggings_"..s,
		recipe = {
			{m, m, m},
			{m, "", m},
			{m, "", m},
		},
	})
	minetest.register_craft({
		output = "3d_armor:boots_"..s,
		recipe = {
			{m, "", m},
			{m, "", m},
		},
	})
end