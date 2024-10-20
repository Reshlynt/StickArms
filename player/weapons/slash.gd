extends Area2D


# If enemy enters the collision box of the slash, take damage.
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
