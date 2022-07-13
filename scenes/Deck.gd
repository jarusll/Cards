extends Control

signal deck_empty

class_name Deck

var count = 0
var selected = null

func _ready():
	pass # Replace with function body.

func add(card):
	$Holder.add_child(card)
	count += 1
	card.connect("clicked", self, "select_card")

func cards():
	var children = []
	for child in $Holder.get_children():
		if is_instance_valid(child):
			children.append(child)
	return children

func remove(card):
	count -= 1
	card.queue_free()
	if count == 0:
		emit_signal("deck_empty")

func select_card(card):
	if selected != null:
		selected.unhighlight()
	selected = card
	card.highlight()

func has_selected():
	if selected:
		return true
	return false

func get_selected():
	return selected

func clear_selection():
	selected = null
