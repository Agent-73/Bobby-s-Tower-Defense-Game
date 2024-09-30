extends Area2D
var health=10
@onready var enemy_path_right: Path2D = $"../EnemyPathRight"
@onready var enemy_path_left: Path2D = $"../EnemyPathLeft"

func _on_body_entered(body:Node2D) -> void:
	if(body.name == "Enemy"):
		health-=body.damage
		body.get_parent().queue_free()
		print("Enemy has made it")
		if(enemy_path_right.get_child_count()<=1) and (enemy_path_left.get_child_count()<=1):
			print("All Enemies Defeated")
		if health<=0:
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")

