extends Control
@onready var button_click_sfx: AudioStreamPlayer = $ButtonClickSFX

func _ready() -> void:
	$VBoxContainer/Start.grab_focus()

#change scene to game
func _on_start_pressed() -> void:
	button_click_sfx.play(0.0)
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://game_manage/StickArmsGame.tscn")

# quits the game entirely
func _on_quit_pressed() -> void:
	button_click_sfx.play(0.0)
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
