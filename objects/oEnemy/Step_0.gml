if(path_position>=0.99) {
	DamageThePlayer(self)
}

ApplyingEffects()

if(life<=0) {
	path_end()
	OnKillItemsProc(self, lastTurretHit) ;
	global.adn+=reward
	instance_destroy(self)
	if (irandom_range(0,100)>95) {
		items_list =[BouncyBalls,ChasseurDeTete,DevilsHat,DoubleShot,ADStacker]
		randn=(irandom_range(0,array_length(items_list)-1))
		selected_item = items_list[randn]
		var created_item = instance_create_layer(10,y,"Instances",selected_item) ;
		add_item_to_inventory(created_item)
	}
	
}


