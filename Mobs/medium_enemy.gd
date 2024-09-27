extends Enemies

	
func _process(delta):
	super._process(delta)
	var speed_increase = total_enemies * speed_multiplier
	speed = 5 + speed_increase
	


