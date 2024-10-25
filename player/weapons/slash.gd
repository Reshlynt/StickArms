extends Area2D

var enemies_in_range = []
@export var timing_ratio = 2/3.0
@onready var slash_sfx: AudioStreamPlayer2D = $SlashSFX

# Runs slash attack timer
func _ready() -> void:
	# hide the slash and disable hitbox
	%Weapon.visible = false
	%HitBox.disabled = true
	$FireRate.start()
 

# Rotate the slash to aim at enemies
func _physics_process(delta: float) -> void:
	enemies_in_range = get_overlapping_bodies()
	#print(%HitArea.get_overlapping_bodies())
	if enemies_in_range.size() > 0:
		var target = enemies_in_range.front()
		look_at(target.global_position)
		

func _on_fire_rate_timeout() -> void:
	
	# Don't attack if there's nothing in range
	if enemies_in_range.size() == 0:
		return


	# display attack
	%Weapon.visible = true
	%HitBox.disabled = false
	slash_sfx.play()
	
	# wait a fraction of the FireRate
	await get_tree().create_timer(%FireRate.wait_time * timing_ratio).timeout
	
	# damage all nodes inside the Area
	#
	# Its key that you do the wait THEN get the overlapping bodies because get_overlapping_bodies() is
	# calculated during the physics step, so you will get nothing if you enable the hitbox and then
	# immediately get the overlapping bodies within the same frame 
	# (After the physics step has already happened)
	for enemy in %HitArea.get_overlapping_bodies():
		# for now I'm going to be skipping the has_method check because the mask should have us covered
		# but if we get some funky business going on, check the masks and if for some reason we need to
		# have something that can't be damaged but still needs to be on mask 2 (bad practice imo) then
		# add the check
		enemy.take_damage()
	
	# hide attack
	%Weapon.visible = false
	%HitBox.disabled = true


func _on_player_stop_slash_sfx() -> void:
	slash_sfx.stop()
