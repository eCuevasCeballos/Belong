extends Node2D

func _process(delta):
	if $Play.is_pressed():
		get_tree().change_scene("res://Scenes/Dscene1.tscn")
		Rockscounter.rocks = 0
