extends Node
@onready var button_click_sfx: AudioStreamPlayer = $"../ButtonClickSFX"
@onready var TREE_NODE = get_tree()

# Turns off pause screen visibility on startup
func _ready() -> void:
	%PauseScreen.visible = false

# Pause the game
func _on_pause_button_pressed() -> void:
	button_click_sfx.play(0.0)
	await get_tree().create_timer(0.1).timeout
	%PauseScreen.visible = true
	%Resume.grab_focus()
	TREE_NODE.paused = true

# Continue game
func _on_resume_pressed() -> void:
	button_click_sfx.play(0.0)
	await get_tree().create_timer(0.1).timeout
	TREE_NODE.paused = false
	%PauseScreen.visible = false

# Go to main menu
func _on_quit_pressed() -> void:
	button_click_sfx.play(0.0)
	await get_tree().create_timer(0.2).timeout
	TREE_NODE.paused = false
	TREE_NODE.change_scene_to_file("res://game_manage/main-menu.tscn")
