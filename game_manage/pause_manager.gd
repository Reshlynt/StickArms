extends Node
# Pause game
func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	%PauseScreen.visible = true


# Resume game
func _on_resume_button_pressed() -> void:
	%PauseScreen.visible = false
	get_tree().paused = false

# Quit game
func _on_quit_to_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://game_manage/main-menu.tscn")
