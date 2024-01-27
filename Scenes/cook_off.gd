extends Node2D

var opponents = []
var index = "Gym Buff"
const jokes = {
		"Gym Buff": ["What do gymnasts eat every morning? A balanced breakfast.",
		"What kind of mill runs all the time? A treadmill.",
		"What do you call a bell that never rings? A dumbbell."],
		"Cook": ["Why is bread so expensive? You need lots of dough to make it.",
		"What kind of bagel can travel? A plain bagel.",
		"What’s orange and sounds like a parrot? A carrot."],
		"Hippie": ["How do you make a tissue dance? You put a boogie in it.",
		"So you want peace on Earth? A piece of what?",
		"My favorite jam never comes on the radio. It comes on my toast, though."],
		"Boomer": ["What’s white and black and ‘red’ all over? A newspaper.",
		"Where do armies belong? In your sleevies.",
		"People told me to get with the times, so I got a job selling clocks."],
		"Trucker": ["How do rangers get to work? They put their cars into park.",
		"If you work at an auto shop, you’ll be forced to retire.",
		"What’s the best road for an ice cream truck? Rocky Road."],
		"Geeky": ["I’ll give you some dead batteries… free of charge!",
		"When does Friday come before Thursday? In the dictionary.",
		"How many feet are in a marathon? Depends on the number of runners."],
		"Football": ["What’s the best way to catch a ball? Ask someone to throw it at you.",
		"Why did the football coach go to the bank? To get his quarter back.",
		"How do pro athletes keep cool? They have many fans."],
		"Business": ["My farmer friend got an award. What for? He was out standing in his field.",
		"What do lawyers wear to work? Law suits.",
		"I always carry a green crayon in case I need to draw money from my account."],
		"Unhealthy": ["How do you make an eggroll? You push it.",
		"What do you call a bear with no teeth? A gummy bear.",
		"I’d tell you a dairy joke, but it’s just too cheesy."],
		"Mid-Life Crisis": ["What’s worse than waking up on the wrong side of the bed? Not waking up.",
		"What do you call a cow with two legs? My ex.",
		"Never broadcast from a graveyard, you’ll just get dead air."]
}
var dadPics = {
	"Gym Buff": load("res://Assets/Sprites/Dads/Gym_dad.png"),
	"Cook": load("res://Assets/Sprites/Dads/Baker_dad.png"),
	"Hippie": load("res://Assets/Sprites/Dads/Hippie.png"),
	"Boomer": load("res://Assets/Sprites/Dads/Boomer.png"),
	"Trucker": load("res://Assets/Sprites/Dads/Mother_trucker_dad.png"),
	"Geeky": load("res://Assets/Sprites/Dads/Nerd_Dad.png"),
	"Football": load("res://Assets/Sprites/Dads/Football_dad.png"),
	"Business": load("res://Assets/Sprites/Dads/Business_Dad.png"),
	"Unhealthy": load("res://Assets/Sprites/Dads/unhealthy_dad.png"),
	"Mid-Life Crisis": load("res://Assets/Sprites/Dads/Mid_life_crisis_dad.png")
}

var dadFood = [
	load("res://Assets/Sprites/Dishes/plate_1.png"),
	load("res://Assets/Sprites/Dishes/plate_2.png"),
	load("res://Assets/Sprites/Dishes/plate_3.png"),
	load("res://Assets/Sprites/Dishes/plate_4.png"),
	load("res://Assets/Sprites/Dishes/plate_5.png"),
	load("res://Assets/Sprites/Dishes/plate_6.png")
]

var medals = [
	load("res://Assets/Sprites/Medals/First_place.png"),
	load("res://Assets/Sprites/Medals/Second_place.png"),
	load("res://Assets/Sprites/Medals/Third_place.png")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	var score = 10
	if score == 10:
		opponents = [2,3,4]
		opponents.shuffle()
		opponents.append(1)
	elif score == 9:
		opponents = [1,3,4]
		opponents.shuffle()
		opponents.append(2)
	elif score >= 7:
		opponents = [2,1,4]
		opponents.shuffle()
		opponents.append(3)
	else:
		opponents = [2,1,3]
		opponents.shuffle()
		opponents.append(4)
	$UI/Dad1/Label.visible=false
	$UI/Dad2/Label.visible=false
	$UI/Dad3/Label.visible=false
	$UI/Dad4/Label.visible=false
	$UI/Dad4/Pick.visible=false
	$UI/Dad4/Joke1.visible=false
	$UI/Dad4/Joke2.visible=false
	$UI/Dad4/Joke3.visible=false
	$UI/Dad1/Dish.visible=false
	$UI/Dad2/Dish.visible=false
	$UI/Dad3/Dish.visible=false
	$UI/Dad4/Dish.visible=false
	$UI/Dad1/Medal.visible=false
	$UI/Dad2/Medal.visible=false
	$UI/Dad3/Medal.visible=false
	$UI/Dad4/Medal.visible=false
	var foodCopy = dadFood
	var foods = []
	while len(foods) < 4:
		var newFood = randi()%len(foodCopy)
		foods.append(foodCopy[newFood])
		foodCopy.remove_at(newFood)
	$UI/Dad1/Dish.texture = foods[0]
	$UI/Dad2/Dish.texture = foods[1]
	$UI/Dad3/Dish.texture = foods[2]
	$UI/Dad4/Dish.texture = foods[3]
	var dads = jokes.keys()
	index = randi() % dads.size()
	$UI/Dad1/Label.text = jokes[dads[index]][randi()%3]
	$UI/Dad1/Sprite2D.texture = dadPics[dads[index]]
	dads.remove_at(index)
	index = randi() % dads.size()
	$UI/Dad2/Label.text = jokes[dads[index]][randi()%3]
	$UI/Dad2/Sprite2D.texture = dadPics[dads[index]]
	dads.remove_at(index)
	index = randi() % dads.size()
	$UI/Dad3/Label.text = jokes[dads[index]][randi()%3]
	$UI/Dad3/Sprite2D.texture = dadPics[dads[index]]
	dads.remove_at(index)
	index = randi() % dads.size()
	$UI/Dad4/Joke1.text = dads[index]
	dads.remove_at(index)
	index = randi() % dads.size()
	$UI/Dad4/Joke2.text = dads[index]
	dads.remove_at(index)
	index = randi() % dads.size()
	$UI/Dad4/Joke3.text = dads[index]
	dads.remove_at(index)
	await get_tree().create_timer(1.0).timeout
	$UI/Dad1/Label.visible=true
	$UI/Dad1/Dish.visible=true
	await get_tree().create_timer(3.0).timeout
	$UI/Dad2/Label.visible=true
	$UI/Dad2/Dish.visible=true
	await get_tree().create_timer(3.0).timeout
	$UI/Dad3/Label.visible=true
	$UI/Dad3/Dish.visible=true
	await get_tree().create_timer(3.0).timeout
	$UI/Dad4/Pick.visible=true
	$UI/Dad4/Joke1.visible=true
	$UI/Dad4/Joke2.visible=true
	$UI/Dad4/Joke3.visible=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $UI/Dad1/Label.visible == true:
		$UI/Dad1/Label.visible_ratio+=0.5*delta
	else:
		$UI/Dad1/Label.visible_ratio=0.0
	if $UI/Dad2/Label.visible == true:
		$UI/Dad2/Label.visible_ratio+=0.5*delta
	else:
		$UI/Dad2/Label.visible_ratio=0.0
	if $UI/Dad3/Label.visible == true:
		$UI/Dad3/Label.visible_ratio+=0.5*delta
	else:
		$UI/Dad3/Label.visible_ratio=0.0
	if $UI/Dad4/Label.visible == true:
		$UI/Dad4/Label.visible_ratio+=0.5*delta
	else:
		$UI/Dad4/Label.visible_ratio=0.0


func _on_joke_1_pressed():
	$UI/Dad4/Label.text = jokes[$UI/Dad4/Joke1.text][randi()%3]
	$UI/Dad4/Label.visible = true
	$UI/Dad4/Dish.visible=true
	$UI/Dad4/Pick.visible = false
	$UI/Dad4/Joke1.visible = false
	$UI/Dad4/Joke2.visible = false
	$UI/Dad4/Joke3.visible = false
	results()

func _on_joke_2_pressed():
	$UI/Dad4/Label.text = jokes[$UI/Dad4/Joke2.text][randi()%3]
	$UI/Dad4/Label.visible = true
	$UI/Dad4/Dish.visible=true
	$UI/Dad4/Pick.visible = false
	$UI/Dad4/Joke1.visible = false
	$UI/Dad4/Joke2.visible = false
	$UI/Dad4/Joke3.visible = false
	results()
	
func _on_joke_3_pressed():
	$UI/Dad4/Label.text = jokes[$UI/Dad4/Joke3.text][randi()%3]
	$UI/Dad4/Label.visible = true
	$UI/Dad4/Dish.visible=true
	$UI/Dad4/Pick.visible = false
	$UI/Dad4/Joke1.visible = false
	$UI/Dad4/Joke2.visible = false
	$UI/Dad4/Joke3.visible = false
	results()

func results():
	await get_tree().create_timer(3.0).timeout
	if opponents[0]==3:
		$UI/Dad1/Medal.texture = medals[2]
		$UI/Dad1/Medal.visible = true
	if opponents[1]==3:
		$UI/Dad2/Medal.texture = medals[2]
		$UI/Dad2/Medal.visible = true
	if opponents[2]==3:
		$UI/Dad3/Medal.texture = medals[2]
		$UI/Dad3/Medal.visible = true
	if opponents[3]==3:
		$UI/Dad4/Medal.texture = medals[2]
		$UI/Dad4/Medal.visible = true
	await get_tree().create_timer(1.0).timeout
	if opponents[0]==2:
		$UI/Dad1/Medal.texture = medals[1]
		$UI/Dad1/Medal.visible = true
	if opponents[1]==2:
		$UI/Dad2/Medal.texture = medals[1]
		$UI/Dad2/Medal.visible = true
	if opponents[2]==2:
		$UI/Dad3/Medal.texture = medals[1]
		$UI/Dad3/Medal.visible = true
	if opponents[3]==2:
		$UI/Dad4/Medal.texture = medals[1]
		$UI/Dad4/Medal.visible = true
	await get_tree().create_timer(1.0).timeout
	if opponents[0]==1:
		$UI/Dad1/Medal.texture = medals[0]
		$UI/Dad1/Medal.visible = true
	if opponents[1]==1:
		$UI/Dad2/Medal.texture = medals[0]
		$UI/Dad2/Medal.visible = true
	if opponents[2]==1:
		$UI/Dad3/Medal.texture = medals[0]
		$UI/Dad3/Medal.visible = true
	if opponents[3]==1:
		$UI/Dad4/Medal.texture = medals[0]
		$UI/Dad4/Medal.visible = true
