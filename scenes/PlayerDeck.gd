extends FannedDeck

const Electrify = preload("res://scenes/ElectrifyAbility.tscn")
const EarthShake = preload("res://scenes/EarthShakeAbility.tscn")
const Fireball = preload("res://scenes/FireballAbility.tscn")
const Icefreeze = preload("res://scenes/IcefreezeAbility.tscn")
const Magical = preload("res://scenes/MagicalAbility.tscn")
const Physical = preload("res://scenes/PhysicalAbility.tscn")
const Magnetic = preload("res://scenes/MagneticAbility.tscn")
const Storm = preload("res://scenes/StormAbility.tscn")
const Watergush = preload("res://scenes/WatergushAbility.tscn")

const Abilities = [Electrify, EarthShake, Fireball, Icefreeze, Magical, Physical, Magnetic, Storm, Watergush]

class_name PlayerDeck

func _ready():
	# for card in cards():
	# 	card.connect("player_card_played", self, "_draw")
	pass # Replace with function body.

func add(card):
	var added = .add(card)
	added.connect("player_card_played", self, "update")

func generate():
	Abilities.shuffle()
	for child in get_children():
		child.queue_free()
	for card in Abilities.slice(0, 5, 1):
		add(card.instance())

# func _draw():
# 	print_debug("player card played and redrawn")
# 	var child_count = get_child_count()
# 	if child_count > 0:
# 		# cards are centered so left half of left most & right half of right most child will 
# 		# be counted in total width
# 		# left half + right half of a child = 1 child_width
# 		# thus subtracting 1 child_width
# 		var child_width = get_child(0).get_width()
# 		var total_width = (child_count * child_width) - child_width
# 		var half_width = total_width / 2

# 		var center = Vector2.ZERO
# 		var left_most_position = center - Vector2(half_width, 0)
# 		for child in get_children():
# 			child.set_position(left_most_position)
# 			left_most_position += Vector2(child_width, 0)