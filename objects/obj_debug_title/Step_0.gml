var enter_=keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));
var back_=keyboard_check_pressed(vk_shift) or keyboard_check_pressed(ord("X"));

switch (state)
{
	case 0:
		if (enter_){state++;}
		break;
	case 1:
		var select= keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
		selection=clamp(selection+select,0,2);
		global.sys_save_slot=selection;
		
		if (enter_){selection=0; state++;}
		break;
	case 2:
		var select= keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		selection=clamp(selection+select,0,1)
		
		if (back_){selection=global.sys_save_slot; state--; exit;}
		if (enter_){
			switch (selection)
			{
				case 0:
					sys_save_start();
					break;
				case 1:
					sys_save_start(true);
					break;
			}
			}
		break;
}