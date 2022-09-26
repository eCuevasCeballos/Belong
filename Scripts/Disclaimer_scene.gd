extends Sprite


onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(10)
	timer.start()




func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/World.tscn")
