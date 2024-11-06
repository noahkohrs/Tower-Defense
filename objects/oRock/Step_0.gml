speed =4  ;

if (instance_exists(target)) {
	direction = point_direction(x, y, target.x, target.y) ;
	image_angle = direction ;
} else {
	target=nearest_enemy()
}
if (x>window_get_width() or y>window_get_height() or x < 0 or y < 0) {
	instance_destroy(self) ;
}
if (place_meeting(x,y,oEnemy)) {
	DamageEnemy(instance_nearest(x,y,oEnemy), damage, caster)
	instance_destroy(self)
}
