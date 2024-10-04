extends CharacterBody2D
class_name Enemies

@export var speed: float = 25
@export var health : int = 3
@export var damage : int = 3
@export var speed_multiplier: float = 1.5
var total_enemies: int = 0
@onready var enemy_path_right = $"../../../EnemyPathRight"
@onready var enemy_path_left = $"../../../EnemyPathLeft"
@onready var TowerButton = $"../../../Tower Button"


func takeDamage(amount:int):
	health-=amount
	print("ow")
	if health<=0:
			print("death")
			if (enemy_path_right.get_child_count()==1 or enemy_path_right.get_child_count()==0) and (enemy_path_left.get_child_count()==1 or enemy_path_left.get_child_count()==0):
				TowerButton.wave_completed()
				print("alldone")
			get_parent().queue_free()
		
		


func _process(delta):
	get_parent().progress+=(speed * delta * speed_multiplier)
	total_enemies = (enemy_path_right.get_child_count())+(enemy_path_left.get_child_count())
	if Input.is_action_just_pressed("ui_text_backspace"):
		takeDamage(1)



