extends Control

# Αλλάξε τη διαδρομή αν η σκηνή του παιχνιδιού σου έχει διαφορετικό όνομα/φάκελο
@export var game_scene_path: String = "res://scenes/game.tscn"

func _on_start_button_pressed() -> void:
	# Μετάβαση στη σκηνή του παιχνιδιού
	get_tree().change_scene_to_file(game_scene_path)

func _on_quit_button_pressed() -> void:
	# Έξοδος από το παιχνίδι
	get_tree().quit()
