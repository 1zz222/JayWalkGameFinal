extends Control

@onready var main_buttons: VBoxContainer = $VBoxContainer
@onready var score_panel: Control = $Score

func _ready() -> void:
	main_buttons.show()
	score_panel.hide()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_score_button_pressed() -> void:
	main_buttons.hide()
	score_panel.show()

func _on_close_score_button_pressed() -> void:
	print("Πατήθηκε το Back!")
	score_panel.hide()
	main_buttons.show()
