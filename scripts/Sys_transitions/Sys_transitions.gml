function Sys_transitions_fade(room_,exit_=-1,time_=10,wait_=0,sound_=-1,gameplay_=true)
{
	var t_ = instance_create_depth(x,y,-9999,obj_ow_transition_fade);
	
	t_.transition_room=room_;
	t_.transition_exit=exit_;
	
	t_.transition_wait=wait_;
	t_.transition_time_max=time_;
	t_.transition_time=0;
	
	t_.transition_ingameplay=gameplay_;
	
	if(sound_!=-1){audio_play_sound(sound_,20,false);}
}