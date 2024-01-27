extends Button

func _ready():
	get_node("Animate_QuitButton").play("Idle")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_button_pressed():
	get_tree().quit()




func _on_mouse_entered():
	get_node("Animate_QuitButton").play("Focus")
	
	


func _on_mouse_exited():
	get_node("Animate_QuitButton").play("Idle")
