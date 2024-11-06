// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ApplyingEffects(){
	//SlowEffect
	path_speed = spd ;
	if (ESlowDuration > 0 and ESlow > 0) {
		path_speed = spd*(ESlow / 100)
	}
	ESlowDuration -= 1 ;
	if (EPoisonDuration > 0 and EPoison > 0) {
		life -= EPoison
	}
	EPoisonDuration -= 1 ;
}


function SlowEnemy(enemy, strength, duration) {
	enemy.ESlow = strength ;
	enemy.ESlowDuration = duration*60 ;
}
