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

var frames = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]

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
	
	for i in frames:
		var item = collectible.instantiate()
		add_child(item)
		item.get_child(1).frame = i
		item.position = placeItem(i)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func placeItem(itemIndex):
	match (itemIndex):
		0: return Vector2($Fruits.position+Vector2(250,200))
		1: return Vector2($Fruits.position+Vector2(500,300))
		2: return Vector2($Meats.position+Vector2(250,350))
		8: return Vector2($Meats.position+Vector2(500,550))
		10: return Vector2($Meats.position+Vector2(900,150))
		14: return Vector2($Fruits.position+Vector2(900,400))
		_: return Vector2(0,0)

func _process(delta):
	pass
