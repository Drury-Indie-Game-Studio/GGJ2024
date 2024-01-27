extends Control


func start_game():
	get_tree().change_scene_to_file("res://Scenes/Intro.tscn")

func quit_game():
	get_tree().quit()
