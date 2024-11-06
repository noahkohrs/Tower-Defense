// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nearest_enemy_in_range(_obj, range) {
	if (distance_to_object(instance_nearest(x,y,oEnemy)) <range) {	return instance_nearest(x,y,oEnemy) ; }
	else {return noone ;}
};

function furthest_enemy_in_range(_obj, range) {
	if (distance_to_object(instance_nearest(x,y,oEnemy)) < range) {	return instance_furthest(x,y,oEnemy) ; }
	else {return noone ;}
};


function latest_enemy_in_range(_obj, range) {
	var _latest_path = 100;
	var _latest_enemy = noone ;
	with oEnemy {
		if (distance_to_object(_obj) <= range) {
			if (path_position<_latest_path) {
				_latest_enemy=self ;
				_latest_path=path_position ;
			}
		}
	}
	return _latest_enemy ;
}

function tankiest_enemy_in_range(_obj, range) {
	var tankiestlife = 0;
	var _strongiest_enemy = noone ;
	with oEnemy {
		if (distance_to_object(_obj) <= range) {
			if (life > tankiestlife) {
				tankiestlife = life
				_strongiest_enemy = self ;
			}
		}
	}
	return _strongiest_enemy ;
}




function nearest_enemy() {
	return instance_nearest(x,y,oEnemy) ;
};

function latest_enemy() {
	var _latest_path = 100;
	var _latest_enemy = noone ;
	with oEnemy {
		if (path_position<_latest_path) {
			_latest_enemy=self ;
			_latest_path=path_position ;
		}
	}
	return _latest_enemy ;
}

function tankiest_enemy() {
	var tankiestlife = 0;
	var _strongiest_enemy = noone ;
	with oEnemy {
		if (life > tankiestlife) {
			tankiestlife = life
			_strongiest_enemy = self ;
		}
	}
	return _strongiest_enemy ;
}

function is_a_valid_caster(caster) {
	return (instance_exists(caster) and object_get_parent(caster.object_index) == oTurret) ;
}



function Shoot(caster,x,y, TypeOfShoot, targeting){
	if (!instance_exists(targeting)) {return 1}
	var inst = instance_create_layer(x,y, "Instances", TypeOfShoot, 
	{
		target : targeting,
		caster : caster
	});
	OnShootItemsProc(inst,caster) ;
}

function merge_item_to_turret(item,turret) {
	array_push(turret.items, item)
	item.merged = true ;
	item.visible = false
	item.x=(31+(array_length(turret.items)-1)*(13+48))*0.4
	item.y=117*0.4 ;
	if (item.slot_id != -1) {array_delete(mainloop.slots_list,item.slot_id, 1) }
	item.slot_id =-1
}

function unify_two_turret(turret_1, turret_2) {
	// Change Caster 
	with oShooting {
		if (caster == turret_1) {
			caster = turret_2 ;
		}
	}
	//Level Uping
	turret_2.baseDamage = turret_1.baseDamage + turret_2.baseDamage ;
	turret_2.baseAttackSpeed= (turret_1.baseAttackSpeed + turret_2.baseAttackSpeed) / 2 ;
	turret_2.baseRange = (turret_1.baseRange + turret_2.baseRange) / 2 ;
	
	//Items Giving
	while (array_length(turret_1.items) > 0) {
		if (array_length(turret_2.items) < 3) {
			var itemc = array_pop(turret_1.items) ;
			merge_item_to_turret(itemc,turret_2)
		}
		else {
			var itemc = array_pop(turret_1.items)
			itemc.merged = false ;
			itemc.x = 20 ;
			itemc.y = 20 ;
			itemc.visible = true
			add_item_to_inventory(itemc)
		}
	}
	
	
	//Deleting turret_1
	tilemap_set(global.map_collision_id, 0, (int64(turret_1.x/16)), (int64(turret_1.y/16)));
	instance_destroy(turret_1) ;
	turret_2.StarLevel++ ;
}

function add_item_to_inventory(item) {
	item.slot_id = array_length(mainloop.slots_list)
	array_push(mainloop.slots_list,item) ;
	
}

function search_nearest_turret(object_index) {
	var distance = 100000 ;
	var ret = noone ;
	with object_index {
		if (point_distance(mouse_x,mouse_y, x, y) < distance) {
			ret = self ;
			distance = point_distance(mouse_x,mouse_y, x, y) ;
		}
	}
	return ret ;
}
