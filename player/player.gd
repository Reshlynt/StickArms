extends CharacterBody2D
signal health_depleted
# adds code on top of Godot code 
# in CharacterBody2D
var health = 100.0
const DAMAGE_RATE = 5.0
@export var SPEED: int = 60

# Operations in pixels per second
# Moves the player
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	

	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	# decrease health
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
	
