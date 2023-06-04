global.ow_player_move = true;
global.ow_game = false;
global.ow_room = noone;

function sys_ow_interaction_create(_x,_y,_depth,_mask)
{
	var a_ = instance_create_depth(_x,_y,_depth,obj_ow_interaction_box);
	a_.mask_index=_mask;
	
	return a_;
}

function sys_ow_interaction_interacted(_object)
{
	return _object.interaction_interacted==true;
}

function sys_ow_set_depth()
{
	depth = -bbox_bottom;
}

function sys_ow_interaction_interact(object_,direction_){

	//XY
	var xyMeeting=noone;
	var x1=0;
	var y1=0;
	var x2=0;
	var y2=0;
	
	switch (direction_){
		case 90: x1=bbox_left+5; y1=bbox_top-8; x2=bbox_right-5; y2=bbox_top; break; // Up
		case 270: x1=bbox_left+5; y1=bbox_bottom+8; x2=bbox_right-5; y2=bbox_bottom; break; // Down
		case 180: x1=bbox_left-8; y1=bbox_top+5; x2=bbox_left; y2=bbox_bottom; break; // Left
		case 0: x1=bbox_right+10; y1=bbox_top+5; x2=bbox_right; y2=bbox_bottom; break; // Right
		}
	
	xyMeeting=collision_rectangle(x1,y1,x2,y2,object_,false,false);
	
	return xyMeeting;
	}