extends CharacterBody2D
class_name Enemies

@export var speed: float = 25
@export var health : int = 3
@export var damage : int = 3
@export var speed_multiplier: float = 1.5
static var total_enemies: int = 0

func _ready():
	total_enemies +=1

func takeDamage(amount:int):
	health-=amount
	print("ow")
	if health<=0:
		queue_free()
		print("death")
		

func _process(delta):
	get_parent().progress+=(speed * delta * speed_multiplier)
	if Input.is_action_just_pressed("ui_text_backspace"):
		takeDamage(1)



