extends Button
var building
var wealth = 10
@export var farmerCost:int = 1
var weak_tower = preload("res://weak_tower.tscn")



func _on_pressed():
	if wealth>=farmerCost:
		print("boom")
		var instance = weak_tower.instantiate()
		get_parent().add_child(instance)
		instance.building=true
	pass # Replace with function body.
