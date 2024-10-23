# Create the slash attack, a damaging move done in intervals
extends Area2D

# Runs slash attack timer
func _ready() -> void:
	$TimerToRest.start()


# Rotate the slash to aim at enemies
func _physiscs_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target = enemies_in_range.front()
		look_at(target.global_position)



# If enemy enters the collision box of the slash, take damage.
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()

# The time that the slash stays on screen and does damage before rest is needed
func _on_timer_to_attack_timeout() -> void:
	%"Horizontal-slash".visible = false
	%CollisionPolygon2D.disabled = true
	
	
	
	
	$TimerToRest.start()

# The time that the slash is disabled until the next attack
func _on_timer_to_rest_timeout() -> void:
	%"Horizontal-slash".visible = true
	%CollisionPolygon2D.disabled = false
	$TimerToAttack.start()
