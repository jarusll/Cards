extends CharacterCard

class_name EnemyCard

func _ready():
	pass # Replace with function body.

func get_class():
	return "EnemyCard"

func take_damage(dp):
	.take_damage(dp)
	if HP <= 0:
		queue_free()