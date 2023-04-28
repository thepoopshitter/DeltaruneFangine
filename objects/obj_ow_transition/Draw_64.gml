switch(transition_activate){
	
	case false:
		transition_alpha+=0.1;
		
		if (transition_alpha>1)
			{
				transition_activate=true;
				global.ow_player_move=true;
				
				room_goto(transition_room);
			}
		break;
		
	case true:
		transition_alpha-=0.1;
		if (transition_alpha<0)
			{
				instance_destroy();
			}
		break;
	}


draw_set_color(c_black);
draw_set_alpha(transition_alpha);
draw_rectangle(0,0,GAME_RESOLUTION_W,GAME_RESOLUTION_H,false);

draw_set_color(c_white);
draw_set_alpha(1);