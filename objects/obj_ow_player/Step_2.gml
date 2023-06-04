#region Stepping animation

var player_stepping=0.15 + (player_speed/50)*(x != xprevious or y != yprevious)

if((x != xprevious or y != yprevious) or image_index==1 or image_index==3)
{
	player_step+=player_stepping;
}

if(player_step>=1){image_index+=1; player_step=0;}
image_index = image_index mod 4;

sprite_index=player_sprite_overworld[player_direction];

#endregion