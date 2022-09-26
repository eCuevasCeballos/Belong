extends CanvasLayer

#Hides the elements of the pause state

func _ready():
	$Background.visible = false
	$P.visible = false

#To change the pause state

func _input(event):
	if event.is_action_pressed("Pause"):
		$Background.visible = !$Background.visible
		$P.visible = !$P.visible
		get_tree().paused = !get_tree().paused 

#Code made by Erick Cuevas
