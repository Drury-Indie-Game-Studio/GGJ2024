extends Node2D

var index = 0
@export var collectible: PackedScene

var section_locations = [
	Vector2(0,0),
	Vector2(1200,0),
	Vector2(2400,0),
	Vector2(0,800),
	Vector2(1200,800),
	Vector2(2400,800)
]

# Called when the node enters the scene tree for the first time.
func _ready():
	index = randi() % section_locations.size()
	$Fruits.position = section_locations[index]
	section_locations.remove_at(index)
	index = randi() % section_locations.size()
	$Bakery.position = section_locations[index]
	section_locations.remove_at(index)
	index = randi() % section_locations.size()
	$Dairy.position = section_locations[index]
	section_locations.remove_at(index)
	index = randi() % section_locations.size()
	$Meats.position = section_locations[index]
	section_locations.remove_at(index)
	index = randi() % section_locations.size()
	$Spices.position = section_locations[index]
	section_locations.remove_at(index)
	$Veggies.position = section_locations[0]
	
	var item = collectible.instantiate()
	add_child(item)
	item.get_child(0).animation = "default"
	item.get_child(0).play()
	item.get_child(0).set_frame_and_progress(10,1.0)
	print(item.get_child(0).frame)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
