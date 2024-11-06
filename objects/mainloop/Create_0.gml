x= 0
y = 0
randomize()
hhh= 59
WaveLevel = 1
used_places = layer_tilemap_get_id("Collision")
map_id = layer_tilemap_get_id(used_places);
collisionTile = 1
waiting_time_between_waves = 240 ;
waitingTime = waiting_time_between_waves ;
instance_create_layer(x, y,"Instances", Buy)
actualWave = array_create(0)
WaveWeight = 5
ennemies = {
	oWorm : {
		Enemy : oWorm,
		Poids : 1,
		quantity : 5,
		StartApp : 1,
		EndApp : 10,
		waiting : 15
	},
	oScarab : {
		Enemy : oScarab,
		Poids : 5,
		quantity : 10,
		StartApp : 10,
		EndApp : 50,
		waiting : 90
	},
	oHagrid : {
		Enemy : oHagrid,
		Poids : 5,
		quantity : 3,
		StartApp : 5,
		EndApp : 50,
		waiting : 30
	}
}

function GenerateNewWave(Weight, WaveLevel) {
	actualWave = array_create(0)
	var pool = array_create(0)
	var BaseWeight = Weight;
	var keys = variable_struct_get_names(ennemies);
	var minEnemySize = 10000
	for (var i = 0; i < array_length(keys); i++)  {
	    var k = keys[i];
	    var ennemy = ennemies[$ k];
		if (ennemy.StartApp <= WaveLevel and ennemy.EndApp >= WaveLevel) {
			if (ennemy.Poids < minEnemySize ) { minEnemySize = ennemy.Poids }
			for (var j = 0 ; j < ennemy.quantity ; j++) {
				array_push(pool, ennemy) ;
			}
		}
	    /* Use k and v here */
	}
	while (Weight >minEnemySize) {
		var n= irandom(array_length(pool) - 1)
		var acc_en = pool[n] ;
		if (Weight >= acc_en.Poids) {
			Weight -= acc_en.Poids ;
			array_push(actualWave, acc_en) ;
		}
	}
}



function AddEnnemieApparition(EnnemieKind, Poids, ApparitionSpike) {
	with instance_create_depth(x,y, 0, ApparitionStatsHolder) {
		self.Enemy = EnnemieKind ;
		self.Poids = Poids ;
		self.ApparitionSpike = ApparitionSpike ;
	}
}


slots_list = array_create(0)

function slot_management() {
	for (var i = 0 ; i < array_length(slots_list); i++) {
		slots_list[i].slot_id = i ;
		slots_list[i].y= 10*i ;
		
	}
}