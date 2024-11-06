speed =4  ;

if (instance_exists(target)) {
	direction = point_direction(x, y, target.x, target.y) ;
	if abs(image_angle-direction <10) {image_angle = direction ;}
	else {image_angle+= 0.05*(image_angle-direction)}
} else {
	target=latest_enemy()
}
if (x>window_get_width() or y>window_get_height() or x < 0 or y < 0) {
	instance_destroy(self) ;
}
if (place_meeting(x,y,oEnemy)) {
	hited_enemy = instance_nearest(x,y,oEnemy)
	SlowEnemy(hited_enemy,50,3)
	DamageEnemy(hited_enemy, damage, caster)
	instance_destroy(self)
}
