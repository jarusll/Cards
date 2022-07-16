extends CharacterCard

signal enemy_cleared
signal enemy_card_played

class_name EnemyCard

func _ready():
	randomize()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var low = 10
	var high = 30
	set_hp(rng.randi_range(low, high))
	transition_uninteractive()
	pass # Replace with function body.

func get_class():
	return "EnemyCard"

func take_damage(dp):
	.take_damage(dp)
	if HP <= 0:
		queue_free()
		emit_signal("enemy_cleared")

func attack(player):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var low = 5
	var high = 10
	player.take_damage(rng.randi_range(low, high))
	emit_signal("enemy_card_played", self)
