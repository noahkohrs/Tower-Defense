suppDamage = 0 ;
suppAttackSpeed = 0 ;
suppRange = 0

TurretStepItemsStatsProc(self) ;


damage = baseDamage +suppDamage
attackSpeed = baseAttackSpeed + suppAttackSpeed
range = baseRange + suppRange

AS_counter =  60/attackSpeed;
if instance_exists(actualTarget) {
	if (distance_to_object(actualTarget) <= range) {
		image_angle = point_direction(x,y, actualTarget.x, actualTarget.y) 
		shoot_cooldown+=1
	}
}
else {
	shoot_cooldown=0
}

image_index = (shoot_cooldown/AS_counter)*image_number
if  (shoot_cooldown >= AS_counter and actualTarget != noone) { 
	shoot_cooldown = 0 ;
	switch (object_index) {
		case URocker :
			actualTarget = nearest_enemy_in_range(self,range) ;
			break;
		case ULaserCaster :
			actualTarget = tankiest_enemy_in_range(self,range) ;
			break;
		case UFreezer :
			actualTarget = latest_enemy_in_range(self,range) ;
			break;
	}
	Shoot(self,x,y,TypeOfShoot,actualTarget)
}


if (global.selected == self and mouse_check_button_released(mb_left)) {
	global.selected = 0
	global.selected_kind = "null" ;
	if instance_number(object_index) > 1 {
		var united_turret = search_nearest_turret(object_index)
			show_debug_message(point_distance(mouse_x,mouse_y, united_turret.x,united_turret.y))
			if ((point_distance(mouse_x,mouse_y, united_turret.x,united_turret.y) < 16) and StarLevel = united_turret.StarLevel and united_turret != self) {
				unify_two_turret(self, united_turret) ;
			}
	}
}




