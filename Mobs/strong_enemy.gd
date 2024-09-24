extends PathFollow2D


@export var speed = 15
@export var health : int = 10
@export var damage : int = 8

func takeDamage(amount:int):
	health-=amount
	print("ow")
	if health<=0:
		queue_free()
		print("death")

func _process(delta):
	progress+=(speed*delta)

