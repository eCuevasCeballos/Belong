extends Area2D


onready var animationplayer = $AnimationPlayer
func _ready():
	animationplayer.play("idle")


func _on_Static_rock_body_entered(body):
	Rockscounter.rocks += 1
	queue_free()
