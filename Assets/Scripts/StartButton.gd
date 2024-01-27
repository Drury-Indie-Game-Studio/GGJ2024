extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("Idle")
# Import necessary module
# If this is not at the beginning of your script
# it can cause issues, so ensure it's at the top.
# (This is needed in Godot 4.2)
# Load the next scene
func _on_button_pressed():
	# Replace "res://SceneB.tscn" with the path to your SceneB file
	var scene_path = "res://Scenes/world.tscn"
	# Change scene
	get_tree().change_scene_to_file(scene_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _quit():
	get_tree().quit()


func _on_mouse_entered():
	get_node("AnimatedSprite2D").play("Focus")


func _on_mouse_exited():
	get_node("AnimatedSprite2D").play("Idle")
