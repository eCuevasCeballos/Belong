extends MarginContainer

func _ready():
	$AudioStreamPlayer.play()

func _on_Mainmenu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
