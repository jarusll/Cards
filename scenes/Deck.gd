extends Node2D

signal deck_empty

class_name Deck

var count = 0
var selected = null

func _ready():
	pass 

func add(card):
	self.add_child(card)
	count += 1
	return card

func cards():
	var children = []
	for child in get_children():
		if is_instance_valid(child):
			children.append(child)
	return children

func remove(card):
	count -= 1
	card.queue_free()
	if count == 0:
		emit_signal("deck_empty")
