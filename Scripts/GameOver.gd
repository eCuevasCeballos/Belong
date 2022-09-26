extends MarginContainer


func _ready():
	Rockscounter.rocks = 0

func _process(delta):
	if $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Try_again.is_pressed():
		get_tree().change_scene("res://Scenes/World.tscn")
	if $CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer/Main_Menu.is_pressed():
		get_tree().change_scene("res://Scenes/MainMenu.tscn")
