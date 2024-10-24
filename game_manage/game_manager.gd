extends Node2D

func _ready() -> void:
	%GameOver.visible = false

#spawns enemies on the path2d node.
func spawn_mob():
	var new_mob = preload("res://enemies/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

# Mob spawner 
func _on_timer_timeout() -> void:
	spawn_mob()

# Game over screen on player defeat
func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true

# Restart the game
func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

# Return to main menu
func _on_quit_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://game_manage/main-menu.tscn")
