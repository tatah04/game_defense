extends Node

signal game_started

	
func start_round():
	print("Start Round!")
	
#Signal from start button
func _on_button_pressed():
	start_round()
	emit_signal("game_started") 

#Signal from restart button
func _on_button_2_pressed():
	get_tree().reload_current_scene()

func reload_scene():
	var current_scene = get_tree().current_scene
	if current_scene:
		reload_scene()
