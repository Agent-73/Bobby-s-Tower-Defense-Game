extends PathFollow2D


@export var speed = 50
@export var health : int = 1
@export var damage : int = 1


func _process(delta):
	progress+=(speed*delta)

