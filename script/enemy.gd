extends CharacterBody2D
# player node reference
@onready var player = get_node(%Player.get_path())

func _physics_process(delta: float):
	# finding the player based the distance between the slime and player
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
