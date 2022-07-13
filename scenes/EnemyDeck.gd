extends Deck

signal enemy_selected

class_name enemydeck

const CharacterCard = preload('res://scenes/CharacterCard.tscn')

func _ready():
	pass # replace with function body.

func generate():
	for i in 2:
		add(CharacterCard.instance())

func make_cards_interactive():
	for card in cards():
		card.can_highlight = true
		card.can_be_clicked = true
		card.can_grow = true

func make_cards_uninteractive():
	for card in cards():
		card.can_highlight = false
		card.can_be_clicked = false
		card.can_grow = false

func select_card(card):
	.select_card(card)
	var selected_enemy = get_selected()
	emit_signal("enemy_selected", selected_enemy)
	print_debug("enemy_selected", selected_enemy)

func clear_turn():
	.clear_selection()
	for card in cards():	
		card.unhighlight()
		card.reset_scale()
	make_cards_uninteractive()
