extends Enemies

func _ready():
	speed_multiplier = total_enemies
func _process(delta):
	super._process(delta)

	if speed_multiplier <=4:
		speed_multiplier = total_enemies*.3
	else:
		speed_multiplier = 4

	


