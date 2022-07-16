extends FannedDeck

signal enemies_turn_played
signal enemies_cleared

class_name EnemyDeck

const Robot = preload("res://scenes/RobotEnemy.tscn")
const Wood = preload("res://scenes/WoodEnemy.tscn")
const Wind = preload("res://scenes/WindEnemy.tscn")
const Water = preload("res://scenes/WaterEnemy.tscn")

const Enemies = [Robot, Wood, Wind, Water]

func _ready():
	pass # Replace with function body.

func add(card):
	var added = .add(card)
	added.connect("enemy_cleared", self, "remove")

func remove(card):
	.remove(card)
	if count <= 0:
		print_debug("enemies cleared")
		emit_signal("enemies_cleared")

func generate():
	for card in get_children():
		card.queue_free()
		count = 0
	Enemies.shuffle()
	for enemy in Enemies:
		add(enemy.instance())
	update()

func play(player):
	for enemy in cards():
		enemy.attack(player)
	emit_signal("enemies_turn_played")
