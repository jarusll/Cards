extends CharacterCard

signal player_died

class_name PlayerCard

func _ready():
	pass # Replace with function body.

func get_class():
	return "CharacterCard"

func set_hp(new_hp):
	.set_hp(new_hp)
	if new_hp <= 0:
		queue_free()
		emit_signal("player_died")
