extends Control

func _ready() -> void:
	# Ελέγχει αν έχασες ή αν τερμάτισες
	if Global.is_game_over:
		$Label3.text = "Game Over!"
	elif Global.last_time > 0:
		$Label3.text = "Your Time: " + str(Global.last_time) + "s"
	else:
		$Label3.text = "Press Space to Start"
	
	# Εμφάνιση του Best Time
	if Global.best_time > 0:
		$Label2.text = "Best Time: " + str(Global.best_time) + "s"
	else:
		$Label2.text = "Best Time: --"

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Space"): 
		get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
