extends Node

@onready var TREE_NODE = get_tree()

# Turns off pause screen visibility on startup
func _ready() -> void:
	%PauseScreen.visible = false

# Pause the game
func _on_pause_button_pressed() -> void:
	%PauseScreen.visible = true
	%Resume.grab_focus()
	TREE_NODE.paused = true

# Continue game
func _on_resume_pressed() -> void:
	TREE_NODE.paused = false
	%PauseScreen.visible = false

# Go to main menu
func _on_quit_pressed() -> void:
	TREE_NODE.paused = false
	TREE_NODE.change_scene_to_file("res://game_manage/main-menu.tscn")
