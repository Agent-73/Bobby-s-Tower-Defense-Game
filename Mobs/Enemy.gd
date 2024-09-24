extends CharacterBody2D

@export var speed = 25
@export var health : int = 3
@export var damage : int = 3

func takeDamage(amount:int):
	health-=amount
	print("ow")
	if health<=0:
		queue_free()
		print("death")
		

func _process(delta):
	get_parent().progress+=(speed*delta)
	if Input.is_action_just_pressed("ui_text_backspace"):
		takeDamage(1)
	

