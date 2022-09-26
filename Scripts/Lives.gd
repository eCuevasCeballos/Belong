extends Node2D


func _ready():
	Livecounter.lives = 3

func _physics_process(delta):
	if Livecounter.lives == 2:
		$Heart.hide()
	if Livecounter.lives == 1:
		$Heart2.hide()
	if Livecounter.lives == 0:
		$Heart3.hide()
