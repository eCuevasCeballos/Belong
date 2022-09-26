extends CanvasLayer

export(String, FILE, "*.json") var dialogue_file

var dialogues = []
var current_dialogue_id = 0

func _ready():
	$Play_button.visible = false
	play()

func _process(delta):
	if $Play_button.is_pressed():
		get_tree().change_scene("res://Scenes/Disclaimer_scene.tscn")

func play():
	dialogues = load_dialogue()
	
	current_dialogue_id = -1
	next_line()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		next_line()

func next_line():
	current_dialogue_id += 1
	if current_dialogue_id >= 7:
		$Play_button.visible = true
		return
	$NinePatchRect/Name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/Msg.text = dialogues[current_dialogue_id]['text']

func load_dialogue():
	var file = File.new()
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		return parse_json(file.get_as_text())
	
