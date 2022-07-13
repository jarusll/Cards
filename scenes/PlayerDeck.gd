extends Deck

signal ability_selected

const AbilityCardBuilder = preload("res://scripts/AbilityCardBuilder.gd")

class_name PlayerDeck

const AbilityCard = preload("res://scenes/AbilityCard.tscn")

func _ready():
	pass # Replace with function body.

func select_card(card):
	.select_card(card)
	emit_signal("ability_selected", card)

func generate():
	add(AbilityCardBuilder.new().build().with_title("FRAG/ment").with_subtitle("KAY/O").with_description("").get_card())

func clear_turn():
	.clear_selection()

func play_turn():
	pass

func enable_turn():
	generate()

func disable_turn():
	for card in cards():
		card.can_grow = false
		card.can_highlight = false
		card.can_be_clicked = false
	self.hide()
	pass