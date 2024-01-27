extends Node2D

var index = 0

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
