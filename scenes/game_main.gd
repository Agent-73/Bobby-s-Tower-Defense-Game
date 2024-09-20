extends Node2D 
# Variables
var wave_timer: Timer
var enemies: Array = []
var enemy_scene: PackedScene
var wave_count: int = 5
var enemies_per_wave: int = 10
var spawn_interval: float = 1.0

func _ready():
	# Load the enemy scene (make sure to set the correct path)
	enemy_scene = preload("res://Mobs/weak_enemy.tscn")
	
	# Create and configure the wave timer
	wave_timer = Timer.new()
	wave_timer.wait_time = spawn_interval
	wave_timer.connect("timeout", self.start_wave, 0)
	add_child(wave_timer)
	wave_timer.start()

	start_wave()

func start_wave():
	for i in range(enemies_per_wave):
		spawn_enemy()

func spawn_enemy():
	if enemies.size() < (wave_count * enemies_per_wave):
		var enemy = enemy_scene.instantiate()
		enemy.position = Vector2(randf_range(100, 800), -50) # Random spawn position
		add_child(enemy)
		enemies.append(enemy)

func _on_wave_timer_timeout():
	spawn_enemy()
	if enemies.size() >= (wave_count * enemies_per_wave):
		wave_timer.stop() # Stop the timer when all enemies are spawned
