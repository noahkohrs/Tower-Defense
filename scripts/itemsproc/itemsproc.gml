
//oEnemy
function OnKillItemsProc(Killed_Unit, Killer){
	if (is_a_valid_caster(Killer)) {
		for (var i = 0 ; i <array_length(Killer.items) ; i++) {
			switch (Killer.items[i].object_index) {
				case ChasseurDeTete:
					if (irandom_range(0,5) == 5)
						reward=reward*5 ;
					break ;
				case ADStacker :
					Killer.items[i].damage+=5
					break;
			}
		}
	}
}

//EnemyFunctions
function OnDamageToEnemysItemsProc(Enemy, Damage, Source, bullet) {
	if is_a_valid_caster(Source) {
		for (var i = 0 ; i <array_length(Source.items) ; i++) {
			switch (Source.items[i].object_index) {
				case BouncyBalls :
					Shoot(bullet, x,y, object_index, furthest_enemy_in_range(self, 100)) ;
					break ;
				case DevilsHat : 
					if (irandom_range(0,20) == 0) { Enemy.path_position = random_range(0.05,0.95); }
					break;
			}
		}
	}
}

//TurretsFunctions
function OnShootItemsProc(inst_shoot, caster) {
	if (is_a_valid_caster(caster)) {
		for (var i = 0 ; i <array_length(caster.items) ; i++) {
			switch (caster.items[i].object_index) {
				case DoubleShot:
					if (irandom_range(0,1) == 1)
						caster.shoot_cooldown=caster.AS_counter;
					break ;
			}
		}
	}
}
//On Shoot


//Path oTurret
function TurretStepItemsStatsProc(Turret){
	if (is_a_valid_caster(Turret)) {
		for (var i = 0 ; i <array_length(Turret.items) ; i++) {
			var item = Turret.items[i]
			if variable_instance_exists(item.id,"damage") { Turret.suppDamage +=item.damage ; }
			if variable_instance_exists(item.id,"attackSpeed") { Turret.suppAttackSpeed +=item.attackSpeed ; }
			if variable_instance_exists(item.id,"range") { Turret.suppRange +=item.range ; }
		}
	}
}
