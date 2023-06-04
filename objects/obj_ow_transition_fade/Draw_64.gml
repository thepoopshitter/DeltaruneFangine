switch(transition_activate){
	
	case false:
		if(transition_ingameplay){global.ow_player_move=false;}
		transition_time++;
		transition_wait-=(transition_time>transition_time_max);
		
		if (transition_wait<0)
			{
				transition_activate=true;
				transition_time=transition_time_max;
				if(transition_ingameplay){global.ow_player_move=true;}
				
				room_goto(transition_room);
			}
		break;
		
	case true:
		transition_time--;
		if (transition_time<0)
			{
				instance_destroy();
			}
		break;
	}


draw_set_color(c_black);
draw_set_alpha(transition_time/transition_time_max);
draw_rectangle(0,0,GAME_RESOLUTION_W,GAME_RESOLUTION_H,false);

draw_set_color(c_white);
draw_set_alpha(1);