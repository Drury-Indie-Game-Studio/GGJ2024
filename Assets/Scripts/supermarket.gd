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

var frames = []

var itemNames = [
	"apple",
	"banana",
	"beef",
	"bread",
	"brownie",
	"butter",
	"carrot",
	"cheese",
	"chicken",
	"cookie",
	"eggs",
	"garlic powder",
	"lettuce",
	"milk",
	"orange",
	"pepper",
	"potato",
	"salt"
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

func placeItems():
	for f in frames:
		var item = collectible.instantiate()
		add_child(item)
		item.get_child(1).frame = f
		item.position = placeItem(f)
		item.itemName = itemNames[f]
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func placeItem(itemIndex):
	match (itemIndex):
		0: return Vector2($Fruits.position+Vector2(250,200))
		1: return Vector2($Fruits.position+Vector2(500,300))
		2: return Vector2($Meats.position+Vector2(250,350))
		3: return Vector2($Bakery.position+Vector2(200,200))
		4: return Vector2($Bakery.position+Vector2(600,300))
		5: return Vector2($Dairy.position+Vector2(250,200))
		6: return Vector2($Veggies.position+Vector2(200,300))
		7: return Vector2($Dairy.position+Vector2(850,200))
		8: return Vector2($Meats.position+Vector2(450,500))
		9: return Vector2($Bakery.position+Vector2(1000,400))
		10: return Vector2($Meats.position+Vector2(850,150))
		11: return Vector2($Spices.position+Vector2(200,200))
		12: return Vector2($Veggies.position+Vector2(900,300))
		13: return Vector2($Dairy.position+Vector2(550,300))
		14: return Vector2($Fruits.position+Vector2(900,400))
		15: return Vector2($Spices.position+Vector2(550,300))
		16: return Vector2($Veggies.position+Vector2(550,350))
		17: return Vector2($Spices.position+Vector2(900,400))
		_: return Vector2(0,0)

func _process(delta):
	pass
