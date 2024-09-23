extends PathFollow2D


@export var speed = 30

func _process(delta):
	progress+=(speed*delta)

