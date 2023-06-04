if (global.ow_player_move == false){exit;}

#region Movement

	var player_speed_real;
	if (keyboard_check(vk_shift) or keyboard_check(ord("X")))
	{
		var player_speed_max=player_speed_max_1;
		if(player_speed_timer>=player_speed_timer_max){player_speed_max=player_speed_max_2;}
		
		player_speed_timer+=(player_speed>=player_speed_max_1);
		
		player_speed=clamp(player_speed+player_speed_add,player_speed_min,player_speed_max);
		
	}
	else{player_speed=player_speed_min; player_speed_timer=0;}

	player_speed_real=floor(player_speed);

	if (keyboard_check(vk_up) && place_free(x,y-player_speed_real))
	{
		player_direction=90;
		y-=player_speed_real;
	}

	if (keyboard_check(vk_down) && place_free(x,y+player_speed_real))
	{
		player_direction=270;
		y+=player_speed_real;
	}

	if (keyboard_check(vk_left) && place_free(x-player_speed_real,y))
	{
		player_direction=180;
		x-=player_speed_real;
	}

	if (keyboard_check(vk_right) && place_free(x+player_speed_real,y))
	{
		player_direction=0;
		x+=player_speed_real;
	}

	sys_ow_set_depth();

#endregion

#region Door collision

	var player_door = noone;
	player_door = instance_place(x,y,obj_ow_door);

	if (player_door != noone){
		Sys_transitions_fade(player_door.door_room,player_door.door_exit,,,,true);
		}

#endregion

#region Interaction

	if(keyboard_check_pressed(ord("Z")))
	{
		var interaction_=sys_ow_interaction_interact(obj_ow_interaction_box,player_direction);
		
		if(interaction_!=noone){interaction_.interaction_interacted=true;}
	}

#endregion