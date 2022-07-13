extends BaseCard

class_name Player

var HP = 100
var has_turn: bool = false

var player_name = "jarusll"

func _ready():
	can_be_clicked = false
	can_grow = true
	set_title(player_name)
	set_subtitle("")
	set_description("")
	set_count(HP)

func take_damage(n):
	HP -= n
	set_count(HP)
	if HP <= 0:
		emit_signal("game_over")

func enable_turn():
	has_turn = true

func disable_turn():
	has_turn = false

func turn():
	return has_turn
