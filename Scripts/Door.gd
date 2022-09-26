extends Area2D

onready var animationplayer = $AnimationPlayer

func _on_Enter_Checker_body_entered(body):

#Plays open animation

	animationplayer.play("Open")

func _on_Enter_Checker_body_exited(body):

#Plays close animation

	animationplayer.play("Close")

func _on_Door_body_entered(body):
	get_tree().change_scene("res://Scenes/Comingsoon.tscn")
