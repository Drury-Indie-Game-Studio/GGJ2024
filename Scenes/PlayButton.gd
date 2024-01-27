extends TextureButton

func _ready():
	get_node("AnimatedSprite2D").play("Idle")


func _on_mouse_entered():
	get_node("AnimatedSprite2D").play("Focus")


func _on_mouse_exited():
	get_node("AnimatedSprite2D").play("Idle")


#func _on_pressed():
	#SoundFx.play_sound()
