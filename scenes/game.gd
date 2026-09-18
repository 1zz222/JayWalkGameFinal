extends Node2D

var carScene : PackedScene = preload("res://scenes/Car.tscn")
var time_elapsed : int = 0 # Χρόνος σε δευτερόλεπτα

func _ready() -> void:
	$CanvasLayer/Label.text = "Time: 0s"

# Spawn αυτοκινήτων
func _on_timer_timeout() -> void:
	var car = carScene.instantiate() as Area2D
	var pos_marker = $CarStartPosition.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)

# Όταν ο παίκτης χτυπάει σε αυτοκίνητο (ΠΕΘΑΙΝΕΙ)
func go_to_title(_body) -> void:
	Global.is_game_over = true
	call_deferred("change_scene")

# Όταν ο παίκτης ΦΤΑΝΕΙ ΣΤΟ ΤΕΡΜΑ (ΚΕΡΔΙΖΕΙ)
func _on_finish_area_2d_body_entered(_body: Node2D) -> void:
	Global.is_game_over = false
	Global.last_time = time_elapsed
	
	# Ενημέρωση Best Time (αν είναι η πρώτη φορά ή αν έκανες μικρότερο χρόνο)
	if Global.best_time == 0 or time_elapsed < Global.best_time:
		Global.best_time = time_elapsed
		
	call_deferred("change_scene")

func change_scene() -> void: 
	get_tree().change_scene_to_file("res://scenes/Title.tscn")

# Timer που μετράει δευτερόλεπτα
func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$CanvasLayer/Label.text = "Time: " + str(time_elapsed) + "s"


func _on_start_button_pressed() -> void:
	pass # Replace with function body.

func _on_main_menu_button_pressed() -> void:
	pass # Replace with function body.
	
	
