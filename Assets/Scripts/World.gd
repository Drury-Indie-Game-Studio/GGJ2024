extends Node2D

var GameTime = 60
var FoundItems = 0
var itemList = ["apple", "banana", "orange", "lettuce", "carrot", "potato", "milk", "cheese", "butter", "eggs", "beef", "chicken", "bread", "cookie", "brownie", "pepper", "salt", "garlic powder"]
var shoppingList = ["", "", "", "", "", "", "", "", "", ""]
var itemDict = {
	"apple":0,
	"banana":1,
	"beef":2,
	"bread":3,
	"brownie":4,
	"butter":5,
	"carrot":6,
	"cheese":7,
	"chicken":8,
	"cookie":9,
	"eggs":10,
	"garlic powder":11,
	"lettuce":12,
	"milk":13,
	"orange":14,
	"pepper":15,
	"potato":16,
	"salt":17
}

var timer = 5
var timerIsGoing = false
func _ready():
	$Race.play(2.37)
	Global.score = 0
	var tempList = itemList
	var e = 0

	for n in shoppingList:
		var x = randi() % tempList.size()
		shoppingList[e] = tempList[x]
		tempList.remove_at(x)
		e = e++1
		pass
	print(shoppingList)
	for a in shoppingList:
		$Supermarket.frames.append(itemDict[a])
	
	$Supermarket.placeItems()
	
	for item in shoppingList:
		var label = Label.new()
		label.text = item
		label.modulate = Color(0,0,0)
		$CanvasLayer/Control/VBoxContainer/HBoxContainer/TextureRect/MarginContainer/List/Items.add_child(label)
		print(label.text)
	$CanvasLayer/Control/VBoxContainer/TimeLeft.text = str(GameTime)
	$Timer.start()
	

func checkTime():
	if GameTime < 1 or Global.score == 10:
		get_tree().change_scene_to_file("res://Scenes/cook_off.tscn")
	else:
		GameTime-=1
	$CanvasLayer/Control/VBoxContainer/TimeLeft.text = str(GameTime)
func _process(delta):
	pass
	if timerIsGoing == true:
		timer = timer-delta
		if timer <= 0:
			pass
		pass
