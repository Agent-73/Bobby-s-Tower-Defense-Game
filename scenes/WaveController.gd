extends Node2D
@onready var enemy_path_right = $EnemyPathRight
@onready var enemy_path_left = $EnemyPathLeft
@onready var gap_timer:Timer = $gapTimer

var weak_enemy = preload("res://Mobs/weak_enemy.tscn")
var medium_enemy = preload("res://Mobs/medium_enemy.tscn")
var strong_enemy = preload("res://Mobs/strong_enemy.tscn")
var fast_enemy = preload("res://Mobs/fast_enemy.tscn")

@export var waveCount:int = 0
func _ready() -> void:
	pass
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		nextWave()
	pass
	
func spawnEnemy(amount,type:PackedScene):
	for i in amount:
		var instance = type.instantiate()
		enemy_path_right.add_child(instance)
		enemy_path_right.add_child(instance)
		instance.rotates=false
		instance.rotation=0
		gap_timer.start()
		await(gap_timer.timeout)
func nextWave():
	waveCount+=1
	print(waveCount)
	if waveCount<=5:
		gap_timer.wait_time=2
		spawnEnemy(waveCount,weak_enemy)
	elif waveCount <=9:
		await spawnEnemy(waveCount,weak_enemy)
		spawnEnemy(waveCount-3,medium_enemy)
	elif waveCount == 10:
		await spawnEnemy(10,medium_enemy)
		spawnEnemy(1,strong_enemy)
	elif waveCount <=15:
		spawnEnemy(1,fast_enemy)
	else:
		print("no more waves, you win!")
	pass

