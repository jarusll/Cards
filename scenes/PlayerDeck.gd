extends FannedDeck

signal player_turn_played

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
	added.connect("player_card_played", self, "remove")

func remove(card):
	.remove(card)
	if count <= 0:
		emit_signal("player_turn_played")

func generate():
	# print_debug("player generate")
	Abilities.shuffle()
	for child in get_children():
		child.queue_free()
		# remove(child)
		count = 0
	for card in Abilities.slice(0, 4, 1):
		add(card.instance())
	print_debug(get_child_count(), get_children())
	update()
	# for child in get_children():
	# 	print_debug(child.get_class())
