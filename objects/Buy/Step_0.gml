

if (global.selected!=0) {
	if (global.selected_kind="placing") {
		if (mouse_check_button_released(mb_left)) {
			if (tilemap_get_at_pixel(global.map_collision_id, mouse_x, mouse_y) == 0) {
				global.adn -= price
				// Adding new unit on the board ;
				_coord_x = (int64(mouse_x/16)) ;
				_coord_y = (int64(mouse_y/16)) ;
				tilemap_set(global.map_collision_id, 1, _coord_x, _coord_y);
				instance_create_layer(_coord_x*16+8, _coord_y*16+8,"Instances", global.selected.Unit)
				global.selected = 0 ;
				global.selected_kind = "null"
				layer_set_visible("Collision", false) ;
				// Reseting the buying system :
				numbrrr = irandom_range(0,2)
				Unit = TypeOfUnit[numbrrr]
				price_indice += 10
				settings_for_units()
			}
		}
	}
}
