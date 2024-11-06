speed =15  ;
if (x>window_get_width() or y>window_get_height() or x < 0 or y < 0) {
	instance_destroy(self) ;
}
if (instance_exists(target)) {
	direction = point_direction(x, y, target.x, target.y)
	image_angle = direction
}




if (place_meeting(x,y,target)) {
	DamageEnemy(target,damage,caster)
	instance_destroy(self)
}
