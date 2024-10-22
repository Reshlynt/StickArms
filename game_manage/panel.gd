extends Panel
#variables for timer
var time: float = 0.0
var minutes: int = 0
var seconds: int = 0


#timer function 
func _process(delta: float) -> void:
	time += delta
	seconds = fmod(time,60)
	minutes = fmod(time,3600)/60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d" % seconds


		
#stops when player dies
func _on_player_health_depleted() -> void:
	set_process(false)
