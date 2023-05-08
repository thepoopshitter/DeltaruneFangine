if (global.ow_player_move == false){exit;}

if (keyboard_check(vk_up) && place_free(x,y-player_speed))
{
	player_direction=90;
	y-=player_speed;
}

if (keyboard_check(vk_down) && place_free(x,y+player_speed))
{
	player_direction=270;
	y+=player_speed;
}

if (keyboard_check(vk_left) && place_free(x-player_speed,y))
{
	player_direction=180;
	x-=player_speed;
}

if (keyboard_check(vk_right) && place_free(x+player_speed,y))
{
	player_direction=0;
	x+=player_speed;
}

if(x != xprevious or y != yprevious)
{
	image_speed=0.2;
}
else{image_speed=0; image_index=0;}

sprite_index=player_sprite_overworld[player_direction];

var player_door = noone;
player_door = instance_place(x,y,obj_ow_door);

if (player_door != noone){
	var t_ = instance_create_depth(x,y,-9999,obj_ow_transition);
	t_.transition_room = player_door.door_room;
	t_.transition_exit = player_door.door_exit;
	}

if (keyboard_check_pressed(vk_enter)){sys_save_save();}