extends Enemies

var maxhealth=health
func _ready():
	maxhealth=health 

func _process(delta):
	super._process(delta)
	if health >0:
		var health_ratio = maxhealth / health
		speed_multiplier = health_ratio
		scale = Vector2(1,1)/ health_ratio
		if scale.x < 0.1:
			scale = Vector2(0.1,0.1)
		
		
	
	
	
