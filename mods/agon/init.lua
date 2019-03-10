minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.0.0",
	})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  2.5",
	})
    
end)
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 3,
		damage_groups = {fleshy = 10},
	}
})
minetest.register_tool(":default:sword_diamond", {
	description = "Diamond Sword",
	inventory_image = "default_tool_diamondsword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
		},
		damage_groups = {fleshy=8},
	},
})
minetest.register_on_joinplayer(function(player)
   local override_table = player:get_physics_override()
   override_table.new_move = false
   override_table.sneak_glitch = true
   player:set_physics_override(override_table)
   minetest.setting_set("time_speed", "0")
   minetest.set_timeofday(0.5)
   minetest.setting_set("node_highlighting", "box")
   player:set_inventory_formspec("")
end)
minetest.register_on_newplayer(function(player)
	player:setpos({x=-41, y=12, z=0})
    local player_inv = player:get_inventory()
    player_inv:set_size("armor", 6)
    player_inv:add_item("main","default:sword_diamond")
end)
local timer = 0
minetest.register_globalstep(function(dtime)
    
    local file2 = io.open(minetest.get_worldpath().."/zw.txt", "r")
	local zw = file2:read("*l")
    file2:close()
    lv = io.open(minetest.get_worldpath().."/level.txt", "r")
	local level = lv:read("*l")
    lv:close()
    local file = io.open(minetest.get_worldpath().."/ver.txt", "r")
	local ver = file:read("*l")
    file:close()
    local file = io.open(minetest.get_worldpath().."/timer.txt", "r")
	local timerf = file:read("*l")
    file:close()
    timer = tonumber(timerf)

    for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		if not object:is_player() then
            local ent = object:get_luaentity()
			if tonumber(ent.npc_name) ~= tonumber(ver) then
                object:remove()
            end
		end
	end
    if tonumber(timer) > 0 then
	    timer = timer + dtime
        local pos1 = {x=16, y=10, z=0}
        local pos2 = {x=25, y=10, z=9}
        local pos3 = {x=34, y=10, z=0}
        local pos4 = {x=25, y=10, z=-9}
        ki = io.open(minetest.get_worldpath().."/kills.txt", "r")
	    local kills = ki:read("*l")
        ki:close()
        if tonumber(level) == 1 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 5 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 2 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 5 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("6")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 6 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 3 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 5 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 4 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 5 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("6")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 6 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 5 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 5 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("6")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 6 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("7")
		        zw:close()
            elseif tonumber(timer) >= 35 and tonumber(zw) == 7 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("8")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 8 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("9")
		        zw:close()
            elseif tonumber(timer) >= 45 and tonumber(zw) == 9 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("10")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 10 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("11")
		        zw:close()
            elseif tonumber(timer) >= 55 and tonumber(zw) == 11 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 6 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 7 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("6")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 6 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 8 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 9 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 10 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 11 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 45 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 12 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 45 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 13 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 45 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 14 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 45 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 15 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 15 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 45 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 16 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 17 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 80 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 18 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 80 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 19 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 80 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 100 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 20 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 40 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 80 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 100 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 21 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 22 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 100 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 23 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 24 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 100 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 25 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 25 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 75 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 100 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 26 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 90 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 120 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 27 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 90 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 120 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 150 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 28 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 90 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 120 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 29 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 90 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 120 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 30 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 1 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 60 and tonumber(zw) == 2 then
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 90 and tonumber(zw) == 3 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 120 and tonumber(zw) == 4 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 150 and tonumber(zw) == 5 then
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 31 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv1")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("1")
		        zw:close()
            elseif tonumber(timer) >= 10 and tonumber(zw) == 1 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv2")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("2")
		        zw:close()
            elseif tonumber(timer) >= 20 and tonumber(zw) == 2 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv3")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("3")
		        zw:close()
            elseif tonumber(timer) >= 30 and tonumber(zw) == 3 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv4")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("4")
		        zw:close()
            elseif tonumber(timer) >= 50 and tonumber(zw) == 4 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv5")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("5")
		        zw:close()
            elseif tonumber(timer) >= 70 and tonumber(zw) == 5 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv6")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("6")
		        zw:close()
            elseif tonumber(timer) >= 100 and tonumber(zw) == 6 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv7")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("7")
		        zw:close()
            elseif tonumber(timer) >= 130 and tonumber(zw) == 7 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv8")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("8")
		        zw:close()
            elseif tonumber(timer) >= 160 and tonumber(zw) == 8 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv9")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("9")
		        zw:close()
            elseif tonumber(timer) >= 200 and tonumber(zw) == 9 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv10")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("10")
		        zw:close()
            elseif tonumber(timer) >= 240 and tonumber(zw) == 10 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv11")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("11")
		        zw:close()
            elseif tonumber(timer) >= 290 and tonumber(zw) == 11 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv12")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("12")
		        zw:close()
            elseif tonumber(timer) >= 340 and tonumber(zw) == 12 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv13")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("13")
		        zw:close()
            elseif tonumber(timer) >= 390 and tonumber(zw) == 13 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv14")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("14")
		        zw:close()
            elseif tonumber(timer) >= 450 and tonumber(zw) == 14 then
                for _,player in ipairs(minetest.get_connected_players()) do
                    player:set_hp(player:get_hp()+8)
                end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos2,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos4,"mobs:monster_lv15")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
        if tonumber(level) == 32 then
            if tonumber(kills) > 0 and tonumber(zw) == 0 then
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
            end
	        if tonumber(zw) == 0 then
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
                local obj = minetest.env:add_entity(pos1,"mobs:monster_lv16")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                local obj = minetest.env:add_entity(pos3,"mobs:monster_lv16")
                local ent = obj:get_luaentity()
                ent.npc_name = ver
                zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		        zw:write("0")
		        zw:close()
                timer = 0
	        end
        end
    end
    local k = 0
    if tonumber(level) == 1 then
        k = 10
    elseif tonumber(level) == 2 then
        k = 14
    elseif tonumber(level) == 3 then
        k = 10
    elseif tonumber(level) == 4 then
        k = 14
    elseif tonumber(level) == 5 then
        k = 24
    elseif tonumber(level) == 6 then
        k = 10
    elseif tonumber(level) == 7 then
        k = 14
    elseif tonumber(level) == 8 then
        k = 10
    elseif tonumber(level) == 9 then
        k = 10
    elseif tonumber(level) == 10 then
        k = 10
    elseif tonumber(level) == 11 then
        k = 10
    elseif tonumber(level) == 12 then
        k = 8
    elseif tonumber(level) == 13 then
        k = 12
    elseif tonumber(level) == 14 then
        k = 10
    elseif tonumber(level) == 15 then
        k = 12
    elseif tonumber(level) == 16 then
        k = 8
    elseif tonumber(level) == 17 then
        k = 10
    elseif tonumber(level) == 18 then
        k = 10
    elseif tonumber(level) == 19 then
        k = 12
    elseif tonumber(level) == 20 then
        k = 12
    elseif tonumber(level) == 21 then
        k = 8
    elseif tonumber(level) == 22 then
        k = 10
    elseif tonumber(level) == 23 then
        k = 8
    elseif tonumber(level) == 24 then
        k = 10
    elseif tonumber(level) == 25 then
        k = 10
    elseif tonumber(level) == 26 then
        k = 10
    elseif tonumber(level) == 27 then
        k = 12
    elseif tonumber(level) == 28 then
        k = 10
    elseif tonumber(level) == 29 then
        k = 10
    elseif tonumber(level) == 30 then
        k = 12
    elseif tonumber(level) == 31 then
        k = 60
    elseif tonumber(level) == 32 then
        k = 2
    elseif tonumber(level) == 33 then
        k = 1
    end
    ki = io.open(minetest.get_worldpath().."/kills.txt", "r")
	local kills = ki:read("*l")
    ki:close()
    if tonumber(kills) == k then
        timer = 0
        zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
		zw:write("0")
		zw:close()
        ki = io.open(minetest.get_worldpath().."/kills.txt", "w")
		ki:write("0")
		ki:close()
        le = io.open(minetest.get_worldpath().."/level.txt", "w")
		le:write(level+1)
		le:close()
        local file = io.open(minetest.get_worldpath().."/ver.txt", "r")
	    local ver = file:read("*l")
        file:close()
        ver2 = io.open(minetest.get_worldpath().."/ver.txt", "w")
	    ver2:write(ver+1)
	    ver2:close()
        timer = 0
        for _,player in ipairs(minetest.get_connected_players()) do
            if tonumber(level) < 32 then
                player:setpos({x=-35, y=10, z=0})
            else
                player:setpos({x=54, y=10, z=0})
            end
            player:set_hp(20)
            for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		        if not object:is_player() then
			        if object:get_entity_name() then
				        object:remove()
			        end
		        end
	        end
        end
    end
    fi = io.open(minetest.get_worldpath().."/timer.txt", "w")
	fi:write(timer)
	fi:close()
end)

minetest.register_chatcommand("start", {
	params = "",
	description = "Starts the game",
	func = function(name, param)
        lv = io.open(minetest.get_worldpath().."/level.txt", "r")
	    local level = lv:read("*l")
        lv:close()
        fi = io.open(minetest.get_worldpath().."/timer.txt", "w")
	    fi:write("0.1")
	    fi:close()
        zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
	    zw:write("0")
	    zw:close()
        ki = io.open(minetest.get_worldpath().."/kills.txt", "w")
	    ki:write("0")
	    ki:close()
        if tonumber(level) == 33 then
        else
            local player = minetest.get_player_by_name(name)
            for _,player in ipairs(minetest.get_connected_players()) do
                player:setpos({x=25, y=10, z=0})
                for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		            if not object:is_player() then
			            if object:get_entity_name() then
				            object:remove()
			            end
		            end
	            end
            end
        end
	end,
})



minetest.register_on_respawnplayer(function(player)
	fi = io.open(minetest.get_worldpath().."/timer.txt", "w")
	fi:write("0")
	fi:close()
    zw = io.open(minetest.get_worldpath().."/zw.txt", "w")
	zw:write("0")
	zw:close()
    ki = io.open(minetest.get_worldpath().."/kills.txt", "w")
	ki:write("0")
	ki:close()
    local file = io.open(minetest.get_worldpath().."/ver.txt", "r")
	local ver = file:read("*l")
    file:close()
    ver2 = io.open(minetest.get_worldpath().."/ver.txt", "w")
	ver2:write(ver+1)
	ver2:close()
    timer = 0
    for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		if not object:is_player() then
			if object:get_entity_name() then
				object:remove()
			end
		end
	end
    player:setpos({x=-35, y=10, z=0})
    player:set_look_yaw(284)
    return true
end)