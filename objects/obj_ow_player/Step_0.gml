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