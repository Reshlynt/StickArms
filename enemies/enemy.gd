extends CharacterBody2D
# player node reference
@onready var player: Node = get_node("/root/Game/Player")
#enemy health
@export var health = 3
@export var speed = 40.0

# Loads at beginning of game.
func _ready() -> void:
	# Call on animation function
	pass

# finding the player based the distance between the enemy and player
func _physics_process(delta: float):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

#function to allow enemies to take damage by the player
func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
		# add death animate if needed
