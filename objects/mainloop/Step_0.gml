waitingTime-=1
if (array_length(actualWave) > 0) {
	if(waitingTime <= 0) {
		spawn_coming_monster()
		waitingTime= 60 ;
	}
}
else {
	if (!instance_exists(oEnemy)) {
		waiting = 1000 ;
		WaveLevel++ ;
		WaveWeight= int64(1.3*WaveWeight)
		GenerateNewWave(WaveWeight, WaveLevel)
	}
}





function spawn_coming_monster() {
	var hagrid = array_pop(actualWave) ;
	waitingTime = int64(hagrid.waiting/WaveLevel) ;
	instance_create_layer(x,y, "Instances", hagrid.Enemy) ;
}

slot_management()