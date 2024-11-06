image_xscale = 0.5
image_yscale = 0.5
x = 16
y= int64(260/16)*16


TypeOfUnit = [URocker, ULaserCaster, UFreezer]
randomize()
numbrrr = irandom_range(0,2)
Unit = TypeOfUnit[numbrrr]
price_indice = 10
price = 100

//Unit = TypeOfUnit[irandom_range(0,TypeOfUnit.length)]
//attackSpeed = Unit.attackSpeed - (Unit.attackSpeed*irandom_range(-100,101)/200)
//damage = irandom_range(-100,101)/150
//range=irandom_range(-100,101)/150
settings_for_units()


global.map_collision_id =layer_tilemap_get_id("Collision")

