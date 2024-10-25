extends Control

func _ready() -> void:
	$VBoxContainer/Start.grab_focus()

#change scene to game
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game_manage/StickArmsGame.tscn")

# quits the game entirely
func _on_quit_pressed() -> void:
	get_tree().quit()



func _on_settings_pressed() -> void:
	#print("LOAD OPTIONS MENU")
	get_tree().change_scene_to_file("res://game_manage/Settings.tscn")
	#change to SettingsPage Later
