extends KinematicBody2D

var velocity = Vector2(0,0)
var direction = 1
const speed = 300

func _ready():
	velocity.x = speed * direction

func _physics_process(delta):
	if is_on_wall():
		queue_free()
	
	velocity = move_and_slide(velocity, Vector2.UP)

func enemy_death():
	pass

func _on_Area2D_body_entered(body):
	body.enemy_death()
