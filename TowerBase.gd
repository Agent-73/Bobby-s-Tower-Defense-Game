extends Node2D
class_name Tower
@export var attackRange:float = 5
@export var damage: int =1
@export var price: int = 10
@export var attackCD:float=2
@export var projectile:PackedScene
@export var rangeBox: Area2D

var inRangeEnemies:Array[CharacterBody2D] = []
var attackTimer:Timer = Timer.new()

func _ready() -> void:
	rangeBox.scale = Vector2(attackRange, attackRange)
	print(rangeBox.scale)
	rangeBox.body_entered.connect(addtoRange)
	rangeBox.body_exited.connect(removeFromRange)
	add_child(attackTimer)
	attackTimer.one_shot=true
	attackTimer.wait_time=attackCD
	attackTimer.timeout.connect(fireProj)

func _process(_delta: float)-> void:
	pass
func placeTower():
	pass
func fireProj():if inRangeEnemies != []:
	if inRangeEnemies != []:
		print("bam!")
		attackTimer.start()
		var instance = projectile.instantiate() 
		get_parent().add_child.call_deferred(instance)
		instance.damage = damage
		instance.target = inRangeEnemies[0].get_parent()
		instance.startPoint = global_position
		instance.startRot = rotation
	
func addtoRange(body:Node2D):
	if (body is Enemies):
		inRangeEnemies.append(body)
		if inRangeEnemies[0] == body and attackTimer.is_stopped()==true:
			fireProj()
		else:
			if attackTimer.time_left<=0:
				attackTimer.start()
				
func removeFromRange(body:Node2D):
	if(body is Enemies):
		inRangeEnemies.erase(body)
		
