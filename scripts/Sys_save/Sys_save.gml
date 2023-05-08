global.sys_save_slot = 0;

function sys_save_get_name()
{
	return "file_"+string(global.sys_save_slot)+".sav";
}

function sys_save_save()
{
	
	// Saving data
	var save_struct={
		Room: room_get_name(room),
		}
	
	var save_string=json_stringify(save_struct);
	var save_buffer=buffer_create(string_byte_length(save_string)+1,buffer_fixed,1)
	buffer_write(save_buffer,buffer_string,save_string);
	buffer_save(save_buffer, sys_save_get_name());
	buffer_delete(save_buffer);
	
}

function sys_save_load(reset_=false)
{
	
	if(!reset_ && file_exists(sys_save_get_name()))
	{
		var save_buffer=buffer_load(sys_save_get_name());
		var save_string=buffer_read(save_buffer,buffer_string);
		var save_struct=json_parse(save_string);
		buffer_delete(save_buffer);
	
		// Loading data
		global.ow_room=asset_get_index(save_struct.Room);
	}
	
	if (reset_ or !file_exists(sys_save_get_name()))
	{
		global.ow_room=rm_test;
	}
	
}

function sys_save_start(reset_=false)
{
	sys_save_load(reset_);
	global.ow_game = true;
	
	room_goto(global.ow_room);
}