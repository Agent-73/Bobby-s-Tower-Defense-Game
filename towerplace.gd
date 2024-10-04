extends Button
var building
var wealth = 0
@export var farmerCost:int = 1
var weak_tower = preload("res://weak_tower.tscn")
@onready var EnemyPathRight=$"../EnemyPathRight"
@onready var EnemyPathLeft=$"../EnemyPathLeft"
@onready var label=$Label

func _process(delta:float)-> void:
	label.text = str(wealth)
func wave_completed():
	wealth +=1
	print("wealth=+1")

func _on_pressed():
	if wealth>=farmerCost:
		print("boom")
		var instance = weak_tower.instantiate()
		get_parent().add_child(instance)
		instance.building=true
	pass # Replace with function body.
