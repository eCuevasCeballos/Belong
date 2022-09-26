extends MarginContainer


onready var animationPlayer = $CenterContainer/VBoxContainer/SpriteMenu/AnimationPlayer



func _ready():
	animationPlayer.play("Walk_Menu")

func _process(delta):
	if $CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/Start.is_pressed():
		get_tree().change_scene("res://Scenes/Dscene1.tscn")
		queue_free()
	if $CenterContainer/VBoxContainer/CenterContainer3/HBoxContainer/HowToPlay.is_pressed():
		get_tree().change_scene("res://Scenes/HowToPlay.tscn")
	if $CenterContainer/VBoxContainer/CenterContainer2/HBoxContainer/Exit.is_pressed():
		get_tree().quit()
	Rockscounter.rocks = 0
