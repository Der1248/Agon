local hud_levels = {}
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.3.0",
	})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  3.0.3",
	})
    hud_levels[name] = player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=-450},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Level: /",
	})
end)
local map_version = 1
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
minetest.register_node("agon:wall",{
	description = "Wall",
	tiles = {"agon_wall.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("agon:spawn",{
	description = "Mob Spawn",
	tiles = {"agon_spawn.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("agon:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"agon_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	light_source = 15,
})
function file_check(file_name)
	local file_found=io.open(file_name, "r")
	if file_found==nil then
		file_found=false
	else
		file_found=true
	end
	return file_found
end
function lvbut(from,num,level2)
    local formspec = ""
    .."image_button[4.5,-0.3;0.8,0.8;;esc;X]"
    .."background[5,6.5;1,1;gui_formbg.png;true]"
    .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
    .."bgcolor[#080808BB;true]"
    if tonumber(level2) > from and num > 0 then
        formspec = formspec.."button[0,1;1,1;a;"..(from+1).."]"
    end
    if tonumber(level2) > (from+1) and num > 1 then
        formspec = formspec.."button[1,1;1,1;b;"..(from+2).."]"
    end
    if tonumber(level2) > (from+2) and num > 2 then
        formspec = formspec.."button[2,1;1,1;c;"..(from+3).."]"
    end
    if tonumber(level2) > (from+3) and num > 3 then
        formspec = formspec.."button[3,1;1,1;d;"..(from+4).."]"
    end
    if tonumber(level2) > (from+4) and num > 4 then
        formspec = formspec.."button[4,1;1,1;e;"..(from+5).."]"
    end
    if tonumber(level2) > (from+5) and num > 5 then
        formspec = formspec.."button[0,2;1,1;f;"..(from+6).."]"
    end
    if tonumber(level2) > (from+6) and num > 6 then
        formspec = formspec.."button[1,2;1,1;g;"..(from+7).."]"
    end
    if tonumber(level2) > (from+7) and num > 7 then
        formspec = formspec.."button[2,2;1,1;h;"..(from+8).."]"
    end
    if tonumber(level2) > (from+8) and num > 8 then
        formspec = formspec.."button[3,2;1,1;i;"..(from+9).."]"
    end
    if tonumber(level2) > (from+9) and num > 9 then
        formspec = formspec.."button[4,2;1,1;j;"..(from+10).."]"
    end
    if tonumber(level2) > (from+10) and num > 10 then
        formspec = formspec.."button[0,3;1,1;k;"..(from+11).."]"
    end
    if tonumber(level2) > (from+11) and num > 11 then
        formspec = formspec.."button[1,3;1,1;l;"..(from+12).."]"
    end
    if tonumber(level2) > (from+12) and num > 12 then
        formspec = formspec.."button[2,3;1,1;m;"..(from+13).."]"
    end
    if tonumber(level2) > (from+13) and num > 13 then
        formspec = formspec.."button[3,3;1,1;n;"..(from+14).."]"
    end
    if tonumber(level2) > (from+14) and num > 14 then
        formspec = formspec.."button[4,3;1,1;o;"..(from+15).."]"
    end
    if tonumber(level2) > (from+15) and num > 15 then
        formspec = formspec.."button[0,4;1,1;p;"..(from+16).."]"
    end
    if tonumber(level2) > (from+16) and num > 16 then
        formspec = formspec.."button[1,4;1,1;q;"..(from+17).."]"
    end
    if tonumber(level2) > (from+17) and num > 17 then
        formspec = formspec.."button[2,4;1,1;r;"..(from+18).."]"
    end
    if tonumber(level2) > (from+18) and num > 18 then
        formspec = formspec.."button[3,4;1,1;s;"..(from+19).."]"
    end
    if tonumber(level2) > (from+19) and num > 19 then
        formspec = formspec.."button[4,4;1,1;t;"..(from+20).."]"
    end
    if tonumber(level2) > (from+20) and num > 20 then
        formspec = formspec.."button[0,5;1,1;u;"..(from+21).."]"
    end
    if tonumber(level2) > (from+21) and num > 21 then
        formspec = formspec.."button[1,5;1,1;v;"..(from+22).."]"
    end
    if tonumber(level2) > (from+22) and num > 22 then
        formspec = formspec.."button[2,5;1,1;w;"..(from+23).."]"
    end
    if tonumber(level2) > (from+23) and num > 23 then
        formspec = formspec.."button[3,5;1,1;x;"..(from+24).."]"
    end
    if tonumber(level2) > (from+24) and num > 24 then
        formspec = formspec.."button[4,5;1,1;y;"..(from+25).."]"
    end
    return formspec
end

minetest.register_on_joinplayer(function(player)
	local override_table = player:get_physics_override()
	override_table.new_move = false
	override_table.sneak_glitch = true
	player:set_physics_override(override_table)
	minetest.setting_set("time_speed", "0")
	minetest.set_timeofday(0.5)
	minetest.setting_set("node_highlighting", "box")
	player:set_inventory_formspec("")
	if file_check(minetest.get_worldpath().."/level.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/level.txt", "w")
		file:write("1")
		file:close()
	end
	if file_check(minetest.get_worldpath().."/Map_Version.txt") == true then
	else
		minetest.place_schematic({ x = 4, y = 9, z = -14 }, minetest.get_modpath("agon").."/schematics/sector1.mts","0")
		file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write(map_version)
		file:close()
	end
	file = io.open(minetest.get_worldpath().."/Map_Version.txt", "r")
	local map_ver = file:read("*l")
    file:close()
	if tonumber(map_ver) < map_version then
		minetest.place_schematic({ x = 4, y = 9, z = -14 }, minetest.get_modpath("agon").."/schematics/sector1.mts","0")
		file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write(map_version)
		file:close()
	end
end)

minetest.register_on_newplayer(function(player)
	player:setpos({x=7, y=10, z=0})
    local player_inv = player:get_inventory()
    player_inv:add_item("main","default:sword_diamond")
end)

local w11 = {}
w11.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/32]"
        formspec = formspec..lvbut(0,25,level2)
        if tonumber(level2) > 25 then
            formspec = formspec.."button[2.5,6;1,1;wab;>]"
        end
	return formspec		
end
local w12 = {}
w12.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/32]"
		formspec = formspec.."button[1.5,6;1,1;waa;<]"
        formspec = formspec..lvbut(25,7,level2)
        if tonumber(level2) > 32 then
            formspec = formspec.."label[0,3;you completed Agon]"
        end
	return formspec		
end
minetest.register_node("agon:new_w1",{
	tiles  = {"default_silver_sandstone_block.png","default_silver_sandstone_block.png","default_silver_sandstone_block.png","default_silver_sandstone_block.png^agon_new_w1.png","default_silver_sandstone_block.png","default_silver_sandstone_block.png"},
	description = "New",
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        local player_inv = player:get_inventory()
		player_inv:set_size("page1", 1)
        local page = player_inv:get_stack("page1", 1):get_count()+1
        if page == 1 then
            minetest.show_formspec(player:get_player_name(), "w11" , w11.get_formspec(player))
		elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w12" , w12.get_formspec(player))
        end
    end,
})
minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
    player_inv:set_size("ll", 1)
    player_inv:set_size("l", 6)
    player_inv:set_size("page1", 1)
	if formname == "w11" or formname == "w12" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"1_"..v)
                player_inv:set_stack("l",  1, "default:dirt "..v)
                player_inv:set_stack("ll", 1, "default:dirt 1")
            end
        end
	end
	if fields.waa then
        player_inv:set_stack("page1",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w11" , w11.get_formspec(player))
    elseif fields.wab then
        player_inv:set_stack("page1",  1, "default:dirt")
        minetest.show_formspec(player:get_player_name(), "w12" , w12.get_formspec(player))
    else
        minetest.show_formspec(player:get_player_name(), "", "")
	end
end)
local new_level = {}
local total_monster = 0
local timer = 1000
minetest.register_on_joinplayer(function(player)
	local meta = player:get_meta()
	timer = meta:get_int("timer")
	local player_inv = player:get_inventory()
	total_monster = player_inv:get_stack("total_monster", 1):get_count()
	local ll = player_inv:get_stack("ll", 1):get_count()
    local l = player_inv:get_stack("l", ll):get_count()
	if ll > 0 and l > 0 then
		local lv = io.open(minetest.get_modpath("agon").."/lv"..ll.."_"..l..".txt", "r")
		new_level = {}
		for line in lv:lines() do
			t, m1, m2, m3, m4 = line:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
			table.insert(new_level, line);
		end
	end
end)
function New(player,page)
    local player_inv = player:get_inventory()
	for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		if not object:is_player() then
			if object:get_entity_name() then
				object:remove()
			end
		end
	end
	player:setpos({x=25, y=10, z=0})
	player:set_hp(20)
	local lv = io.open(minetest.get_modpath("agon").."/lv"..page..".txt", "r")
	new_level = {}
	total_monster = 0
	for line in lv:lines() do
		t, m1, m2, m3, m4 = line:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
		table.insert (new_level, line);
		if tonumber(m1) > 0 then
			total_monster = total_monster+1
		end
		if tonumber(m2) > 0 then
			total_monster = total_monster+1
		end
		if tonumber(m3) > 0 then
			total_monster = total_monster+1
		end
		if tonumber(m4) > 0 then
			total_monster = total_monster+1
		end
	end
	timer = 0
	local meta = player:get_meta()
	meta:set_int("timer", 0)
	player_inv:set_size("zw", 1)
	player_inv:set_stack("zw", 1, "default:dirt")
	player_inv:set_size("total_monster", 1)
	player_inv:set_stack("total_monster", 1, "default:dirt "..total_monster)
	player_inv:set_size("kills", 1)
	player_inv:set_stack("kills", 1, nil)
end
local pos1 = {x=16, y=10, z=0}
local pos2 = {x=25, y=10, z=9}
local pos3 = {x=34, y=10, z=0}
local pos4 = {x=25, y=10, z=-9}
local pos5 = {x=16, y=11, z=0}
local pos6 = {x=34, y=11, z=0}
local timer2 = 0
local set = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	timer2 = timer2 + dtime
    local players = minetest.get_connected_players()
    for _,player in ipairs(players) do
        local player_inv = player:get_inventory()
        player_inv:set_size("ll", 1)
        player_inv:set_size("l", 4)
		player_inv:set_size("zw", 1)
        local ll = player_inv:get_stack("ll", 1):get_count()
        local l = player_inv:get_stack("l", ll):get_count()
        if ll == 0 then
        else
            player:hud_change(hud_levels[player:get_player_name()], 'text', "Level: World "..ll.."."..l)
        end
		local zw = player_inv:get_stack("zw", 1):get_count()
		if zw > 0 then
			if new_level[zw] then
				t, m1, m2, m3, m4 = new_level[zw]:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
				if timer > tonumber(t) then
					if l == 31 then
						player:set_hp(player:get_hp()+8)
					end
					player_inv:set_stack("zw", 1, "default:dirt "..zw+1)
					if tonumber(m1) > 0 and l ~= 32 then
						local obj = minetest.env:add_entity(pos1,"mobs:monster_lv"..m1)
					end
					if tonumber(m2) > 0 then
						local obj = minetest.env:add_entity(pos2,"mobs:monster_lv"..m2)
					end
					if tonumber(m3) > 0 and l ~= 32 then
						local obj = minetest.env:add_entity(pos3,"mobs:monster_lv"..m3)
					end
					if tonumber(m4) > 0 then
						local obj = minetest.env:add_entity(pos4,"mobs:monster_lv"..m4)
					end
					
					if tonumber(m1) > 0 and l == 32 then
						local obj = minetest.env:add_entity(pos5,"mobs:monster_lv"..m1)
					end
					if tonumber(m3) > 0 and l == 32 then
						local obj = minetest.env:add_entity(pos6,"mobs:monster_lv"..m3)
					end
				end
			end
			local kills = player_inv:get_stack("kills", 1):get_count()
			if kills >= total_monster then
				minetest.chat_send_all("level completed")
				player:set_hp(20)
				lv = io.open(minetest.get_worldpath().."/level.txt", "r")
				local level = lv:read("*l")
				lv:close()
				if tonumber(l) == tonumber(level) then
					le = io.open(minetest.get_worldpath().."/level.txt", "w")
					le:write(level+1)
					le:close()
				end
				timer = 1000
				zw = 0
				total_monster = 0
				player_inv:set_stack("kills", 1, nil)
				player_inv:set_size("zw", 1)
				player_inv:set_stack("zw", 1, "default:dirt "..zw)
				player_inv:set_size("total_monster", 1)
				player_inv:set_stack("total_monster", 1, "default:dirt "..total_monster)
				player:setpos({x=7, y=10, z=0})
			end
		end
		local meta = player:get_meta()
		meta:set_int("timer", timer)
    end
	if timer2 >= 1 then
		timer2 = 0
		for i = 4, 39 do
			for j = 0, 14 do
				minetest.set_node({x=i, y=9, z=j}, {name="agon:wall"})
				minetest.set_node({x=i, y=9, z=(-1)*j}, {name="agon:wall"})
			end
		end
		for m = 10,12 do
			for j = 0, 4 do
				minetest.set_node({x=4, y=m, z=j}, {name="agon:wall"})
				minetest.set_node({x=4, y=m, z=(-1)*j}, {name="agon:wall"})
				minetest.set_node({x=10, y=m, z=j}, {name="agon:wall"})
				minetest.set_node({x=10, y=m, z=(-1)*j}, {name="agon:wall"})
				minetest.set_node({x=11, y=m, z=j}, {name="agon:wall"})
				minetest.set_node({x=11, y=m, z=(-1)*j}, {name="agon:wall"})
				minetest.set_node({x=39, y=m, z=j}, {name="agon:wall"})
				minetest.set_node({x=39, y=m, z=(-1)*j}, {name="agon:wall"})
			end
			for i = 5, 9 do
				minetest.set_node({x=i, y=m, z=4}, {name="agon:wall"})
				minetest.set_node({x=i, y=m, z=-4}, {name="agon:wall"})
			end
			for i = 21, 29 do
				minetest.set_node({x=i, y=m, z=14}, {name="agon:wall"})
				minetest.set_node({x=i, y=m, z=-14}, {name="agon:wall"})
			end
			minetest.set_node({x=12, y=m, z=5}, {name="agon:wall"})
			minetest.set_node({x=13, y=m, z=6}, {name="agon:wall"})
			minetest.set_node({x=14, y=m, z=7}, {name="agon:wall"})
			minetest.set_node({x=15, y=m, z=8}, {name="agon:wall"})
			minetest.set_node({x=16, y=m, z=9}, {name="agon:wall"})
			minetest.set_node({x=17, y=m, z=10}, {name="agon:wall"})
			minetest.set_node({x=18, y=m, z=11}, {name="agon:wall"})
			minetest.set_node({x=19, y=m, z=12}, {name="agon:wall"})
			minetest.set_node({x=20, y=m, z=13}, {name="agon:wall"})
			minetest.set_node({x=12, y=m, z=-5}, {name="agon:wall"})
			minetest.set_node({x=13, y=m, z=-6}, {name="agon:wall"})
			minetest.set_node({x=14, y=m, z=-7}, {name="agon:wall"})
			minetest.set_node({x=15, y=m, z=-8}, {name="agon:wall"})
			minetest.set_node({x=16, y=m, z=-9}, {name="agon:wall"})
			minetest.set_node({x=17, y=m, z=-10}, {name="agon:wall"})
			minetest.set_node({x=18, y=m, z=-11}, {name="agon:wall"})
			minetest.set_node({x=19, y=m, z=-12}, {name="agon:wall"})
			minetest.set_node({x=20, y=m, z=-13}, {name="agon:wall"})
			minetest.set_node({x=38, y=m, z=5}, {name="agon:wall"})
			minetest.set_node({x=37, y=m, z=6}, {name="agon:wall"})
			minetest.set_node({x=36, y=m, z=7}, {name="agon:wall"})
			minetest.set_node({x=35, y=m, z=8}, {name="agon:wall"})
			minetest.set_node({x=34, y=m, z=9}, {name="agon:wall"})
			minetest.set_node({x=33, y=m, z=10}, {name="agon:wall"})
			minetest.set_node({x=32, y=m, z=11}, {name="agon:wall"})
			minetest.set_node({x=31, y=m, z=12}, {name="agon:wall"})
			minetest.set_node({x=30, y=m, z=13}, {name="agon:wall"})
			minetest.set_node({x=38, y=m, z=-5}, {name="agon:wall"})
			minetest.set_node({x=37, y=m, z=-6}, {name="agon:wall"})
			minetest.set_node({x=36, y=m, z=-7}, {name="agon:wall"})
			minetest.set_node({x=35, y=m, z=-8}, {name="agon:wall"})
			minetest.set_node({x=34, y=m, z=-9}, {name="agon:wall"})
			minetest.set_node({x=33, y=m, z=-10}, {name="agon:wall"})
			minetest.set_node({x=32, y=m, z=-11}, {name="agon:wall"})
			minetest.set_node({x=31, y=m, z=-12}, {name="agon:wall"})
			minetest.set_node({x=30, y=m, z=-13}, {name="agon:wall"})
		end
		for i = 4, 10 do
			for j = 0, 4 do
				minetest.set_node({x=i, y=13, z=j}, {name="agon:meselamp"})
				minetest.set_node({x=i, y=13, z=(-1)*j}, {name="agon:meselamp"})
			end
		end
		for i = 21, 29 do
			minetest.set_node({x=i, y=13, z=14}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=13, z=-14}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=14, z=13}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=14, z=-13}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=15, z=12}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=15, z=-12}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=16, z=11}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=16, z=-11}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=17, z=10}, {name="agon:meselamp"})
			minetest.set_node({x=i, y=17, z=-10}, {name="agon:meselamp"})
		end
		for j = 0, 4 do
			minetest.set_node({x=11, y=13, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=11, y=13, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=39, y=13, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=39, y=13, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=12, y=14, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=12, y=14, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=38, y=14, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=38, y=14, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=13, y=15, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=13, y=15, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=37, y=15, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=37, y=15, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=14, y=16, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=14, y=16, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=36, y=16, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=36, y=16, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=15, y=17, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=15, y=17, z=(-1)*j}, {name="agon:meselamp"})
			minetest.set_node({x=35, y=17, z=j}, {name="agon:meselamp"})
			minetest.set_node({x=35, y=17, z=(-1)*j}, {name="agon:meselamp"})
		end
		for i = 16, 34 do
			for j = 0, 9 do
				minetest.set_node({x=i, y=18, z=j}, {name="agon:meselamp"})
				minetest.set_node({x=i, y=18, z=(-1)*j}, {name="agon:meselamp"})
			end
		end
		minetest.set_node({x=12, y=13, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=13, y=13, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=14, y=13, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=13, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=13, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=13, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=13, z=11}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=13, z=12}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=13, z=13}, {name="agon:meselamp"})
		minetest.set_node({x=12, y=13, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=13, y=13, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=14, y=13, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=13, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=13, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=13, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=13, z=-11}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=13, z=-12}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=13, z=-13}, {name="agon:meselamp"})
		minetest.set_node({x=38, y=13, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=37, y=13, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=36, y=13, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=13, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=13, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=13, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=13, z=11}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=13, z=12}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=13, z=13}, {name="agon:meselamp"})
		minetest.set_node({x=38, y=13, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=37, y=13, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=36, y=13, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=13, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=13, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=13, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=13, z=-11}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=13, z=-12}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=13, z=-13}, {name="agon:meselamp"})
		minetest.set_node({x=13, y=14, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=14, y=14, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=14, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=14, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=14, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=14, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=14, z=11}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=14, z=12}, {name="agon:meselamp"})
		minetest.set_node({x=13, y=14, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=14, y=14, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=14, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=14, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=14, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=14, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=14, z=-11}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=14, z=-12}, {name="agon:meselamp"})
		minetest.set_node({x=37, y=14, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=36, y=14, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=14, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=14, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=14, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=14, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=14, z=11}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=14, z=12}, {name="agon:meselamp"})
		minetest.set_node({x=37, y=14, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=36, y=14, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=14, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=14, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=14, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=14, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=14, z=-11}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=14, z=-12}, {name="agon:meselamp"})
		minetest.set_node({x=14, y=15, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=15, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=15, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=15, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=15, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=15, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=15, z=11}, {name="agon:meselamp"})
		minetest.set_node({x=14, y=15, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=15, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=15, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=15, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=15, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=15, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=15, z=-11}, {name="agon:meselamp"})
		minetest.set_node({x=36, y=15, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=15, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=15, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=15, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=15, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=15, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=15, z=11}, {name="agon:meselamp"})
		minetest.set_node({x=36, y=15, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=15, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=15, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=15, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=15, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=15, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=15, z=-11}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=16, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=16, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=16, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=16, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=16, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=16, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=15, y=16, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=16, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=16, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=16, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=16, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=16, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=16, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=16, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=16, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=16, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=16, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=16, z=10}, {name="agon:meselamp"})
		minetest.set_node({x=35, y=16, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=16, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=16, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=16, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=16, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=16, z=-10}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=17, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=17, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=17, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=17, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=17, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=17, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=17, y=17, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=18, y=17, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=19, y=17, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=20, y=17, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=17, z=5}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=17, z=6}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=17, z=7}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=17, z=8}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=17, z=9}, {name="agon:meselamp"})
		minetest.set_node({x=34, y=17, z=-5}, {name="agon:meselamp"})
		minetest.set_node({x=33, y=17, z=-6}, {name="agon:meselamp"})
		minetest.set_node({x=32, y=17, z=-7}, {name="agon:meselamp"})
		minetest.set_node({x=31, y=17, z=-8}, {name="agon:meselamp"})
		minetest.set_node({x=30, y=17, z=-9}, {name="agon:meselamp"})
		minetest.set_node({x=16, y=9, z=0}, {name="agon:spawn"})
		minetest.set_node({x=25, y=9, z=9}, {name="agon:spawn"})
		minetest.set_node({x=34, y=9, z=0}, {name="agon:spawn"})
		minetest.set_node({x=25, y=9, z=-9}, {name="agon:spawn"})
		minetest.set_node({x=10, y=11, z=0}, {name="agon:new_w1"})
	end
end)



minetest.register_on_respawnplayer(function(player)
	timer = 1000
	zw = 0
	total_monster = 0
	local player_inv = player:get_inventory()
	player_inv:set_stack("kills", 1, nil)
	player_inv:set_size("zw", 1)
	player_inv:set_stack("zw", 1, "default:dirt "..zw)
	player_inv:set_size("total_monster", 1)
	player_inv:set_stack("total_monster", 1, "default:dirt "..total_monster)
    for _,object in ipairs(minetest.env:get_objects_inside_radius({x=25, y=10, z=0}, 20)) do
		if not object:is_player() then
			if object:get_entity_name() then
				object:remove()
			end
		end
	end
    player:setpos({x=7, y=10, z=0})
    return true
end)