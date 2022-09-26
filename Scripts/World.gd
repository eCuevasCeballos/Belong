extends Node2D

#Checks if the player falls of the map

func _on_Fall_Checker_body_entered(body):
	get_tree().change_scene("res://Scenes/GameOver.tscn")
