extends CharacterBody2D
signal health_depleted
signal stop_slash_sfx
var health = 100.0
const DAMAGE_RATE = 5.0
@export var speed: int = 60
@onready var player_death_sfx: AudioStreamPlayer2D = $PlayerDeath
@onready var player_movement_sfx: AudioStreamPlayer2D = $Playermovement
@onready var background_sfx: AudioStreamPlayer2D = $backgroundmusic
# Operations in pixels per second
# Moves the player
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	background_sfx.play()
	if velocity.length() > 0:
		await get_tree().create_timer(0.09).timeout
		player_movement_sfx.play()
	else:
		pass
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	# decrease health
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%HealthBar.value = health
		if health <= 0.0:
			player_death_sfx.play()
			$Sprite2D.visible = false
			%HealthBar.visible = false
			health_depleted.emit()

func _on_game_stop_death_sfx() -> void:
	player_death_sfx.stop()
	stop_slash_sfx.emit()
