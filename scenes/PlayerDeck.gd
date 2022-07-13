extends Deck

signal ability_selected

class_name PlayerDeck

const AbilityCard = preload("res://scenes/AbilityCard.tscn")

func _ready():
	pass # Replace with function body.

func select_card(card):
	.select_card(card)
	emit_signal("ability_selected", card)
	# print_debug("ability_selected", card)

func generate():
	for i in 5:
		add(AbilityCard.instance())

func clear_turn():
	.clear_selection()
