extends FannedDeck

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
	added.connect("player_card_played", self, "update")

func generate():
	for card in get_children():
		card.queue_free()
	Enemies.shuffle()
	for enemy in Enemies:
		add(enemy.instance())