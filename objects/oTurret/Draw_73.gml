if (global.selected == self) {
	draw_sprite_ext(sprite_index, -1, mouse_x, mouse_y, 1.2, 1.2, 90, c_white, 1)
}




if (point_distance(mouse_x,mouse_y, x, y) <= 8 and !mouse_check_button(mb_left)) {
	show_hud(mouse_x,mouse_y) ;
}
