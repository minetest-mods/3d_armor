
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = minetest.get_translator(minetest.get_current_modname())

--- Arcanite
--
--  Requires `armor_material_arcanite`.
--
--  @section arcanite

if armor.materials.arcanite then
	--- Arcanite Helmet
	--
	--  @helmet 3d_armor:helmet_arcanite
	--  @img 3d_armor_inv_helmet_arcanite.png
	--  @grp armor_head 1
	--  @grp armor_heal 8
	--  @grp armor_use 400
	--  @armorgrp fleshy 12
	--  @damagegrp cracky 2
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp level 3
	armor:register_armor(":3d_armor:helmet_arcanite", {
		description = S("Arcanite Helmet"),
		inventory_image = "3d_armor_inv_helmet_arcanite.png",
		groups = {armor_head=1, armor_heal=8, armor_use=400},
		armor_groups = {fleshy=12},
		damage_groups = {cracky=2, snappy=2, choppy=2, level=3},
	})
	--- Arcanite Chestplate
	--
	--  @chestplate 3d_armor:chestplate_arcanite
	--  @img 3d_armor_inv_chestplate_arcanite.png
	--  @grp armor_torso 1
	--  @grp armor_heal 8
	--  @grp armor_use 400
	--  @armorgrp fleshy 17
	--  @damagegrp cracky 2
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp level 3
	armor:register_armor(":3d_armor:chestplate_arcanite", {
		description = S("Arcanite Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_arcanite.png",
		groups = {armor_torso=1, armor_heal=8, armor_use=400},
		armor_groups = {fleshy=17},
		damage_groups = {cracky=2, snappy=2, choppy=2, level=3},
	})
	--- Arcanite Leggings
	--
	--  @leggings 3d_armor:leggings_arcanite
	--  @img 3d_armor_inv_leggings_arcanite.png
	--  @grp armor_legs 1
	--  @grp armor_heal 8
	--  @grp armor_use 400
	--  @armorgrp fleshy 17
	--  @damagegrp cracky 2
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp level 3
	armor:register_armor(":3d_armor:leggings_arcanite", {
		description = S("Arcanite Leggings"),
		inventory_image = "3d_armor_inv_leggings_arcanite.png",
		groups = {armor_legs=1, armor_heal=8, armor_use=400},
		armor_groups = {fleshy=17},
		damage_groups = {cracky=2, snappy=2, choppy=2, level=3},
	})
	--- Arcanite Boots
	--
	--  @boots 3d_armor:boots_arcanite
	--  @img 3d_armor_inv_boots_arcanite.png
	--  @grp armor_feet 1
	--  @grp armor_heal 8
	--  @grp armor_use 400
	--  @armorgrp fleshy 12
	--  @damagegrp cracky 2
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp level 3
	armor:register_armor(":3d_armor:boots_arcanite", {
		description = S("Arcanite Boots"),
		inventory_image = "3d_armor_inv_boots_arcanite.png",
		groups = {armor_feet=1, armor_heal=8, armor_use=400},
		armor_groups = {fleshy=12},
		damage_groups = {cracky=2, snappy=2, choppy=2, level=3},
	})


	--- Crafting
	--
	--  @section craft

	--- Craft recipes for helmets, chestplates, leggings, boots, & shields.
	--
	--  @craft armor
	--  @usage
	--  Key:
	--  - m: material
	--    - wood:    group:wood
	--    - cactus:  default:cactus
	--    - steel:   default:steel_ingot
	--    - bronze:  default:bronze_ingot
	--    - diamond: default:diamond
	--    - gold:    default:gold_ingot
	--    - arcanite: moreores:arcanite_ingot
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

	local s = "arcanite"
	local m = armor.materials.arcanite
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
