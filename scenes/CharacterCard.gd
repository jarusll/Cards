extends BaseCard

class_name CharacterCard

var HP = 100

func _ready():
	transition_interactive()
	set_hp(HP)

func about_to_be_attacked():
	# pass
	transition_highlight()

func crisis_averted():
	transition_uninteractive()

func set_hp(new_hp):
	HP = new_hp
	.set_count(HP)

func take_damage(damage):
	set_hp(HP - damage)

func get_class():
	return "CharacterCard"
