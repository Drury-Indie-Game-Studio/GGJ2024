extends Area2D

var fade = 1.0
var collected = false

func _ready():
	fade = 1.0
	collected = false
	modulate = Color(1.0,1.0,1.0,fade)

func _on_body_entered(body):
	if collected == false:
		collected = true
		print("Collected")

func _process(delta):
	if collected == true:
		fade -= 1.0*delta
		modulate = Color(1.0,1.0,1.0,fade)

