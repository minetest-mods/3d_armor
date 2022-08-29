
--- Registered armors.
--
--  @topic armor


-- support for i18n
local S = armor.get_translator


--- Diamond
--
--  Requires setting `armor_material_diamond`.
--
--  @section diamond

if armor.materials.diamond then
	--- Diamond Helmet
	--
	--  @helmet 3d_armor:helmet_diamond
	--  @img 3d_armor_inv_helmet_diamond.png
	--  @grp armor_head 1
	--  @grp armor_heal 12
	--  @grp armor_use 200
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp choppy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:helmet_diamond", {
		description = S("Diamond Helmet"),
		inventory_image = "3d_armor_inv_helmet_diamond.png",
		groups = {armor_head=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	--- Diamond Chestplate
	--
	--  @chestplate 3d_armor:chestplate_diamond
	--  @img 3d_armor_inv_chestplate_diamond.png
	--  @grp armor_torso 1
	--  @grp armor_heal 12
	--  @grp armor_use 200
	--  @armorgrp fleshy 20
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp choppy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:chestplate_diamond", {
		description = S("Diamond Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_diamond.png",
		groups = {armor_torso=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	--- Diamond Leggings
	--
	--  @leggings 3d_armor:leggings_diamond
	--  @img 3d_armor_inv_leggings_diamond.png
	--  @grp armor_legs 1
	--  @grp armor_heal 12
	--  @grp armor_use 200
	--  @armorgrp fleshy 20
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp choppy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:leggings_diamond", {
		description = S("Diamond Leggings"),
		inventory_image = "3d_armor_inv_leggings_diamond.png",
		groups = {armor_legs=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=20},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
	--- Diamond Boots
	--
	--  @boots 3d_armor:boots_diamond
	--  @img 3d_armor_inv_boots_diamond.png
	--  @grp armor_feet 1
	--  @grp armor_heal 12
	--  @grp armor_use 200
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp choppy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:boots_diamond", {
		description = S("Diamond Boots"),
		inventory_image = "3d_armor_inv_boots_diamond.png",
		groups = {armor_feet=1, armor_heal=12, armor_use=200},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=2, snappy=1, choppy=1, level=3},
	})
end


--- Gold
--
--  Requires `armor_material_gold`.
--
--  @section gold

if armor.materials.gold then
	--- Gold Helmet
	--
	--  @helmet 3d_armor:helmet_gold
	--  @img 3d_armor_inv_helmet_gold.png
	--  @grp armor_head 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.02
	--  @grp physics_gravity 0.02
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor("3d_armor:helmet_gold", {
		description = S("Gold Helmet"),
		inventory_image = "3d_armor_inv_helmet_gold.png",
		groups = {armor_head=1, armor_heal=6, armor_use=300,
			physics_speed=-0.02, physics_gravity=0.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	--- Gold Chestplate
	--
	--  @chestplate 3d_armor:chestplate_gold
	--  @img 3d_armor_inv_chestplate_gold.png
	--  @grp armor_torso 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.05
	--  @grp physics_gravity 0.05
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor("3d_armor:chestplate_gold", {
		description = S("Gold Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_gold.png",
		groups = {armor_torso=1, armor_heal=6, armor_use=300,
			physics_speed=-0.05, physics_gravity=0.05},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	--- Gold Leggings
	--
	--  @leggings 3d_armor:leggings_gold
	--  @img 3d_armor_inv_leggings_gold.png
	--  @grp armor_legs 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.04
	--  @grp physics_gravity 0.04
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor("3d_armor:leggings_gold", {
		description = S("Gold Leggings"),
		inventory_image = "3d_armor_inv_leggings_gold.png",
		groups = {armor_legs=1, armor_heal=6, armor_use=300,
			physics_speed=-0.04, physics_gravity=0.04},
		armor_groups = {fleshy=15},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
	--- Gold Boots
	--
	--  @boots 3d_armor:boots_gold
	--  @img 3d_armor_inv_boots_gold.png
	--  @grp armor_feet 1
	--  @grp armor_heal 6
	--  @grp armor_use 300
	--  @grp physics_speed -0.02
	--  @grp physics_gravity 0.02
	--  @armorgrp fleshy 10
	--  @damagegrp cracky 1
	--  @damagegrp snappy 2
	--  @damagegrp choppy 2
	--  @damagegrp crumbly 3
	--  @damagegrp level 2
	armor:register_armor("3d_armor:boots_gold", {
		description = S("Gold Boots"),
		inventory_image = "3d_armor_inv_boots_gold.png",
		groups = {armor_feet=1, armor_heal=6, armor_use=300,
			physics_speed=-0.02, physics_gravity=0.02},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
	})
end


--- Mithril
--
--  Requires `armor_material_mithril`.
--
--  @section mithril

if armor.materials.mithril then
	--- Mithril Helmet
	--
	--  @helmet 3d_armor:helmet_mithril
	--  @img 3d_armor_inv_helmet_mithril.png
	--  @grp armor_head 1
	--  @grp armor_heal 12
	--  @grp armor_use 100
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:helmet_mithril", {
		description = S("Mithril Helmet"),
		inventory_image = "3d_armor_inv_helmet_mithril.png",
		groups = {armor_head=1, armor_heal=13, armor_use=66},
		armor_groups = {fleshy=16},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	--- Mithril Chestplate
	--
	--  @chestplate 3d_armor:chestplate_mithril
	--  @img 3d_armor_inv_chestplate_mithril.png
	--  @grp armor_torso 1
	--  @grp armor_heal 12
	--  @grp armor_use 100
	--  @armorgrp fleshy 20
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:chestplate_mithril", {
		description = S("Mithril Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_mithril.png",
		groups = {armor_torso=1, armor_heal=13, armor_use=66},
		armor_groups = {fleshy=21},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	--- Mithril Leggings
	--
	--  @leggings 3d_armor:leggings_mithril
	--  @img 3d_armor_inv_leggings_mithril.png
	--  @grp armor_legs 1
	--  @grp armor_heal 12
	--  @grp armor_use 100
	--  @armorgrp fleshy 20
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:leggings_mithril", {
		description = S("Mithril Leggings"),
		inventory_image = "3d_armor_inv_leggings_mithril.png",
		groups = {armor_legs=1, armor_heal=13, armor_use=66},
		armor_groups = {fleshy=21},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
	--- Mithril Boots
	--
	--  @boots 3d_armor:boots_mithril
	--  @img 3d_armor_inv_boots_mithril.png
	--  @grp armor_feet 1
	--  @grp armor_heal 12
	--  @grp armor_use 100
	--  @armorgrp fleshy 15
	--  @damagegrp cracky 2
	--  @damagegrp snappy 1
	--  @damagegrp level 3
	armor:register_armor("3d_armor:boots_mithril", {
		description = S("Mithril Boots"),
		inventory_image = "3d_armor_inv_boots_mithril.png",
		groups = {armor_feet=1, armor_heal=13, armor_use=66},
		armor_groups = {fleshy=16},
		damage_groups = {cracky=2, snappy=1, level=3},
	})
end


--- Nether
--
--  Requires `armor_material_nether`.
--
--  @section nether

if armor.materials.nether then
	--- Nether Helmet
	--
	--  @helmet 3d_armor:helmet_nether
	--  @img 3d_armor_inv_helmet_nether.png
	--  @grp armor_head 1
	--  @grp armor_heal 14
	--  @grp armor_use 200
	--  @grp armor_fire 1
	--  @armorgrp fleshy 18
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp level 3
	armor:register_armor("3d_armor:helmet_nether", {
		description = S("Nether Helmet"),
		inventory_image = "3d_armor_inv_helmet_nether.png",
		groups = {armor_head=1, armor_heal=14, armor_use=100, armor_fire=1},
		armor_groups = {fleshy=18},
		damage_groups = {cracky=3, snappy=2, level=3},
	})
	--- Nether Chestplate
	--
	--  @chestplate 3d_armor:chestplate_nether
	--  @img 3d_armor_inv_chestplate_nether.png
	--  @grp armor_torso 1
	--  @grp armor_heal 14
	--  @grp armor_use 200
	--  @grp armor_fire 1
	--  @armorgrp fleshy 25
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp level 3
	armor:register_armor("3d_armor:chestplate_nether", {
		description = S("Nether Chestplate"),
		inventory_image = "3d_armor_inv_chestplate_nether.png",
		groups = {armor_torso=1, armor_heal=14, armor_use=200, armor_fire=1},
		armor_groups = {fleshy=25},
		damage_groups = {cracky=3, snappy=2, level=3},
	})
	--- Nether Leggings
	--
	--  @leggings 3d_armor:leggings_nether
	--  @img 3d_armor_inv_leggings_nether.png
	--  @grp armor_legs 1
	--  @grp armor_heal 14
	--  @grp armor_use 200
	--  @grp armor_fire 1
	--  @armorgrp fleshy 25
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp level 3
	armor:register_armor("3d_armor:leggings_nether", {
		description = S("Nether Leggings"),
		inventory_image = "3d_armor_inv_leggings_nether.png",
		groups = {armor_legs=1, armor_heal=14, armor_use=200, armor_fire=1},
		armor_groups = {fleshy=25},
		damage_groups = {cracky=3, snappy=2, level=3},
	})
	--- Nether Boots
	--
	--  @boots 3d_armor:boots_nether
	--  @img 3d_armor_inv_boots_nether.png
	--  @grp armor_feet 1
	--  @grp armor_heal 14
	--  @grp armor_use 200
	--  @grp armor_fire 1
	--  @armorgrp fleshy 18
	--  @damagegrp cracky 3
	--  @damagegrp snappy 2
	--  @damagegrp level 3
	armor:register_armor("3d_armor:boots_nether", {
		description = S("Nether Boots"),
		inventory_image = "3d_armor_inv_boots_nether.png",
		groups = {armor_feet=1, armor_heal=14, armor_use=200, armor_fire=1},
		armor_groups = {fleshy=18},
		damage_groups = {cracky=3, snappy=2, level=3},
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
--    - wood:    group:wood
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

for k, v in pairs(armor.materials) do
	minetest.register_craft({
		output = "3d_armor:helmet_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{"", "", ""},
		},
	})
	minetest.register_craft({
		output = "3d_armor:chestplate_"..k,
		recipe = {
			{v, "", v},
			{v, v, v},
			{v, v, v},
		},
	})
	minetest.register_craft({
		output = "3d_armor:leggings_"..k,
		recipe = {
			{v, v, v},
			{v, "", v},
			{v, "", v},
		},
	})
	minetest.register_craft({
		output = "3d_armor:boots_"..k,
		recipe = {
			{v, "", v},
			{v, "", v},
		},
	})
end
