# Create the slash attack, a damaging move done in intervals
extends Area2D

# Runs slash attack timer
func _ready() -> void:
	$TimerToRest.start()

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
