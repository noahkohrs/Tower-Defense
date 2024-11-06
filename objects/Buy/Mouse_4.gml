/// @description Insert description here
// You can write your code in this editor
if (global.adn >=price and (global.selected == 0 or global.selected_kind == "turret")) {
	global.selected_kind = "placing" ;
	global.selected = self
	layer_set_visible("Collision", true) ;
}
