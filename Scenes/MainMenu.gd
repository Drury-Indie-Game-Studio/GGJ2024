extends Control


func start_game():
	var scene_path = "Intro.tscn"
	get_tree().change_scene_to_file(scene_path)
	

func quit_game():
	get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_play_button_pressed():
	get_tree().change_scene_to_file("Intro.tscn")
