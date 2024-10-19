extends Area2D

const SPEED: int = 1000
const RANGE: int = 1200

var travel_distance = 0

# Allows the bullet to travel a distance and destroys itself if it exceedds a limit.
func _physics_process(delta: float):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travel_distance += SPEED * delta
	if travel_distance > RANGE:
		queue_free()

# Signal to determine if some body node has entered this one.
func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
