function DamageThePlayer(_inst) {
	//Damaging the player
	lives -= _inst.damage
	path_end()
	instance_destroy(_inst)
}
function DamageEnemy(enemy, dmg, source) {
	//Damaging an Enemy
	enemy.life -= dmg
	enemy.lastTurretHit = source
	OnDamageToEnemysItemsProc(enemy, dmg, source, self)
}
function EnemyDead(_reward) {
	
}
