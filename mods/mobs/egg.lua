minetest.register_craftitem("mobs:monster_lv1_egg", {
	description = "Monster lv.1 spawn-egg",
	inventory_image = "mobs_egg.png",
	liquids_pointable = false,
	stack_max = 99,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			minetest.env:add_entity(pointed_thing.above,"mobs:monster_lv1")
			if not minetest.setting_getbool("creative_mode") then itemstack:take_item() end
			return itemstack
		end
	end,
})
minetest.register_craftitem("mobs:monster_lv2_egg", {
	description = "Monster lv.2 spawn-egg",
	inventory_image = "mobs_egg.png",
	liquids_pointable = false,
	stack_max = 99,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			minetest.env:add_entity(pointed_thing.above,"mobs:monster_lv2")
			if not minetest.setting_getbool("creative_mode") then itemstack:take_item() end
			return itemstack
		end
	end,
})
minetest.register_craftitem("mobs:monster_lv3_egg", {
	description = "Monster lv.3 spawn-egg",
	inventory_image = "mobs_egg.png",
	liquids_pointable = false,
	stack_max = 99,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			minetest.env:add_entity(pointed_thing.above,"mobs:monster_lv3")
			if not minetest.setting_getbool("creative_mode") then itemstack:take_item() end
			return itemstack
		end
	end,
})