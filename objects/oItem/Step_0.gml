

if (global.selected == self and mouse_check_button_released(mb_left)) {
	global.selected = 0
	global.selected_kind = "null" ;
	if instance_number(oTurret) > 0 {
		var turret= search_nearest_turret(oTurret)
			show_debug_message(point_distance(mouse_x,mouse_y, turret.x,turret.y))
			if (point_distance(mouse_x,mouse_y, turret.x,turret.y) < 11 and array_length(turret.items) < turret.max_items) {
				merge_item_to_turret(self, turret) ;
			}
	}
}


