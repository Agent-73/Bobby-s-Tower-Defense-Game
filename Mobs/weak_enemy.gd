extends PathFollow2D


@export var speed = 25

func _process(delta):
	progress+=(speed*delta)
