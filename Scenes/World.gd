extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D_1.play()
	$AudioStreamPlayer2D_2.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
