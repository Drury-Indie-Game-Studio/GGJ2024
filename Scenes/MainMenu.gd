extends Control

func _ready():
	$AudioStreamPlayer2D.play()
	

func start_game():
	var scene_path = "res://Scenes/Intro.tscn"
	get_tree().change_scene_to_file(scene_path)
	#SoundFx.play_my_sound()
	
func quit_game():
	get_tree().quit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


