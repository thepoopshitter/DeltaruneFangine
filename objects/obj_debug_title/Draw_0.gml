draw_set_color(c_white);
draw_set_font(fnt_determination_sans);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

var heart_x_raw=0;
var heart_y_raw=0;

// Title

var title_x=160;
var title_y=100;

var title_color=make_color_hsv((current_time*0.05) mod 255,255,255)

for (var i=2; i<9; i++)
{
	var title_y_offset=dsin((current_time*0.15) + 25*i-2) * 20;
	draw_sprite_ext(spr_title_title,i,title_x,title_y+title_y_offset,1,1,0,c_white,1);
	
	if (i==5)
	{
		draw_sprite_ext(spr_title_title,1,title_x,title_y+title_y_offset,1,1,0,title_color,1);
	}
}

// State begin
if (state==0){draw_set_color(c_grey); draw_text(160,180,"Press Z or Enter");}

// Menus
if (state>0)
{
	var menu_x=100;
	var menu_y=180;
	
	for (var i=0; i<3; i++)
	{
		var selected_=(global.sys_save_slot==i);
		var menu_x_offset=60*i;
		
		draw_set_color(merge_color(merge_color(c_white,c_yellow,selected_),c_black,(!selected_ && state>1)*0.5));
		draw_text(menu_x+menu_x_offset,menu_y,"File "+string(i+1));
		
		if (selected_&&state==1){heart_x_raw=menu_x+menu_x_offset-28; heart_y_raw=menu_y+7;}
		
	}
	
	if (state==1){draw_set_color(c_grey); draw_text(160,200,"Select file");}
	
	if (state==2)
	{
		var menu_x=160;
		var menu_y=200;
	
		for (var i=0; i<2; i++)
		{
			var selected_=(selection==i);
			var menu_y_offset=15*i;
			var text=[];
			text[0]="Continue";
			text[1]="Restart";
		
			draw_set_color(merge_color(c_white,c_yellow,selected_));
			draw_text(menu_x,menu_y+menu_y_offset,text[i]);
			
			if(selected_){heart_x_raw=menu_x-38; heart_y_raw=menu_y+menu_y_offset+7;}
		
		}
	}
}

heart_x=lerp(heart_x,heart_x_raw,0.5);
heart_y=lerp(heart_y,heart_y_raw,0.5);

draw_sprite_ext(spr_UI_heart_small,0,heart_x,heart_y,1,1,0,c_red,1);