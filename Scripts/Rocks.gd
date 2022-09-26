extends Node2D


func _ready():
	Rockscounter.rocks = Rockscounter.rocks

func _physics_process(delta):
	$R_Qty.text = str(Rockscounter.rocks)
