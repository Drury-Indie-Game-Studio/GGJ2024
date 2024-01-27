extends Area2D

var fade = 1.0
var collected = false
var itemName = "?"

func _ready():
	fade = 1.0
	collected = false
	modulate = Color(1.0,1.0,1.0,fade)

func _on_body_entered(body):
	if collected == false:
		collected = true
		print("Collected "+itemName)
		var itemList = get_node("../../CanvasLayer/Control/VBoxContainer/HBoxContainer/TextureRect/MarginContainer/List/Items").get_children()
		print(itemList)
		for i in itemList:
			print(i)
			if i.text == itemName:
				i.queue_free()
				Global.score += 1

func _process(delta):
	if collected == true:
		fade -= 1.0*delta
		modulate = Color(1.0,1.0,1.0,fade)

