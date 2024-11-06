function settings_for_units() {
	switch (Unit) {
		case URocker: 
			sprite = SRocker ;
			price = 1*price_indice
			break;
		case ULaserCaster: 
			sprite = SLaserCaster ;
			price = 3*price_indice
			break;
		case UFreezer:
			sprite = SFreezer
			price = 1.5*price_indice
			break;
		default:
			sprite = SDunno ;
			break;
	}
}
