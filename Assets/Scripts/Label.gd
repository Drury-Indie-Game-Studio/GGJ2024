extends Label

var on_text = 0
var textTime = 0
var textLines = ["You want to see the kids again...","Problem: So do ALL of her other exes.","You've all agreed to hold a high-steaks cook-out to determine who gets custody.","May the best Dad win."]


# Called when the node enters the scene tree for the first time.
func _ready():
	visible_ratio = 0
	textTime = 0
	on_text = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = textLines[on_text]
	if visible_ratio < 1:
		visible_ratio += delta
	if textTime < 3:
		textTime += delta
	elif on_text < len(textLines) -1:
		visible_ratio = 0
		textTime = 0
		on_text +=1
	else:
		var scene_path = "res://Scenes/world.tscn"
		get_tree().change_scene_to_file(scene_path)
		
	
