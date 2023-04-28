view_enabled = true;
view_visible[0] = true;

view_camera[0] = camera_create_view(0,0,GAME_RESOLUTION_W,GAME_RESOLUTION_H,0,-1,-1,-1,500,500)
view_set_camera(0,view_camera[0]);

surface_resize(application_surface,GAME_RESOLUTION_W,GAME_RESOLUTION_H);

if(!global.ow_game){exit;}

camera_set_view_target(view_camera[0],obj_ow_player);