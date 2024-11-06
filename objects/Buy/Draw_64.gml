/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,-1,x*3,y*3,1.5,1.5,0,c_white,1)
draw_sprite_ext(sprite, -1, (x+80)*global.win_x_size, (y+12)*global.win_y_size, global.win_x_size+1, global.win_y_size+1, 90, c_white, 1)
draw_text_transformed_color((x+10)*global.win_x_size, (y)*global.win_y_size, string(price),global.win_x_size/2,global.win_y_size/2,0,c_white,c_silver,c_white,c_silver,1)
if (global.selected = self) {
	draw_sprite_ext(sprite, -1, mouse_x*3, mouse_y*3, global.win_x_size, global.win_y_size, 90, c_white, 0.5)
	//show_debug_message(sprite)
} 
