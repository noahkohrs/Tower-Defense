
//attackSpeed = attackSpeed - (attackSpeed*irandom_range(-100,101)/200)

//damage = damage + (damage*irandom_range(-100,101)/150)
//range=range + (range*irandom_range(-100,101)/150)
x_shot_offset = 0
y_shot_offset = 0


StarLevel = 1 ;
actualTarget = noone
shoot_cooldown=0
suppDamage = 0
suppAttackSpeed = 0
suppRange = 0
damage = baseDamage +suppDamage
attackSpeed = baseAttackSpeed + suppAttackSpeed
range = baseRange + suppRange
items = array_create(0) ;
max_items = 3 ;
item_size = (44/64*0.4)


function show_hud(mouse_x,mouse_y) {
	while (point_distance(mouse_x,mouse_y,mouse_x,304) < 190*0.4) { mouse_y-- }
	while (point_distance(mouse_x,mouse_y,400,mouse_y) < 230*0.4) { mouse_x-- }
	draw_set_alpha(0.25)
	draw_circle_color(x,y,range,c_yellow,c_yellow, false);
	draw_set_alpha(1)
	draw_circle_color(x,y,range,c_yellow,c_yellow, true);
	draw_sprite_ext(TurretStatsGUI,-1,mouse_x,mouse_y,0.4,0.4,0,c_white,1)
	draw_set_color(#3D1607)
	var decal_y = 9 ;
	draw_text_transformed(mouse_x+15,mouse_y+10,"DMG: " + string(damage),0.22,0.22,0)
	draw_text_transformed(mouse_x+15,mouse_y+10+decal_y,"AS: " + string(attackSpeed),0.22,0.22,0)
	draw_text_transformed(mouse_x+15,mouse_y+10+decal_y*2,"RANGE: " + string(range),0.22,0.22,0)
	draw_set_color(c_white)
	
	for (var i = 0 ; i < array_length(items) ; i++ ) {
		draw_sprite_ext(items[i].sprite_index,-1,mouse_x+items[i].x,mouse_y+items[i].y,item_size,item_size,0,c_white,1) ;
	}
}
