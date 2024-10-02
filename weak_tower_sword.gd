extends Area2D
@export var speed = 5
var attackPoint = Vector2(0,0)

var damage = 1
var target
var startPoint:Vector2
var startRot

func _physics_process(delta:float) -> void:
	
	if target != null:
		rotate(get_angle_to(target.global_position)+44.8)
		attackPoint = (target.global_position)-global_position
		attackPoint.normalized()
		global_position+=attackPoint*speed*delta
		
	else:
		queue_free()
		
func _ready():
	global_position=startPoint
	rotation=startRot

func _on_body_entered(body):
	if body is Enemies:
		body.takeDamage(damage)
		queue_free()
	pass # Replace with function body.
