Modpack - 3d Armor
==================
![3d_armor screenshot](https://github.com/minetest-mods/3d_armor/blob/master/screenshot.png)


![](https://github.com/minetest-mods/3d_armor/workflows/luacheck/badge.svg)
![](https://github.com/minetest-mods/3d_armor/workflows/integration-test/badge.svg)

### Table of Contents
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

- [[mod] Visible Player Armor [3d_armor]](#mod-visible-player-armor-3d_armor)
- [[mod] Visible Wielded Items [wieldview]](#mod-visible-wielded-items-wieldview)
- [[mod] Shields [shields]](#mod-shields-shields)
- [[mod] 3d Armor Stand [3d_armor_stand]](#mod-3d-armor-stand-3d_armor_stand)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


[mod] Visible Player Armor [3d_armor]
-------------------------------------

Adds craftable armor that is visible to other players. Each armor item worn contributes to
a player's armor group level making them less vulnerable to attack.

Armor takes damage when a player is hurt, however, many armor items offer a 'stackable'
percentage chance of restoring the lost health points. Overall armor level is boosted by 10%
when wearing a full matching set (helmet, chestplate, leggings and boots of the same material).

Overview of all items, API and settings: **[3d_armor reference](https://minetest-mods.github.io/3d_armor/reference/)**

**Dependencies:**

* Luanti/Minetest: 5.4.0 or newer
* Mods `default` and `player_api`
   * Provided by [minetest_game](https://github.com/luanti-org/minetest_game)
     and many derivatives

**Features:** (optional)

* Fire protection (added by TenPlus1):
   * Depends on the mod `ethereal` and the (provided) `armor_crystal` mod.
   * Each piece of armor increases fire protection by 1 (one).
      * level 1: protects against torches
      * level 2: protects against crystal spikes
      * level 3: protects against fire
      * level 5: protects against lava
* Inventory mod compatibility:
   * `3d_armor_sfinv` for `sfinv` (minetest_game and derivatives)
   * `3d_armor_ip` for `inventory_plus`
   * `3d_armor_ui` for `unified_inventory`
   * Compatible with `smart_inventory` without any mod dependency.
* Supported skin mods:
   * `skins` by Zeg9
   * `player_textures` by PilzAdam
   * `simple_skins` by TenPlus1
   * Supported by `skinsdb`
* Supported physics mods:
   * `player_monoids`
   * `armor_monoid`
   * `pova`

Armor can be configured by adding a file called armor.conf in 3d_armor mod or world directory.
see armor.conf.example for all available options.

**Types of armor:**

The specific "armors as modpack" refactorization allows anyone to enable/disable any armors they want as mods rather than obscure settings of the past. (See [#78](https://github.com/minetest-mods/3d_armor/commit/9444afd7222a71fc17d40c9793506812d715dcc3) for further explanation.)

- armor_admin
- armor_bronze
- armor_cactus
- armor_crystal
- armor_diamond
- armor_gold
- armor_mithril
- armor_nether
- armor_steel
- armor_wood

All these mods depend on 3d_armor.

[mod] Visible Wielded Items [wieldview]
---------------------------------------

Depends: 3d_armor

Makes hand wielded items visible to other players.

[mod] Shields [shields]
-----------------------

Depends: 3d_armor

Originally a part of 3d_armor, shields have been re-included as an optional extra.
If you do not want shields then simply remove the shields folder from the modpack.

[mod] 3d Armor Stand [3d_armor_stand]
-------------------------------------

Depends: 3d_armor

Adds a chest-like armor stand for armor storage and display.
