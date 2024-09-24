extends PathFollow2D


@export var speed = 30
@export var health : int = 5
@export var damage : int = 4

func takeDamage(amount:int):
	health-=amount
	print("ow")
	if health<=0:
		queue_free()
		print("death")


func _process(delta):
	progress+=(speed*delta)

