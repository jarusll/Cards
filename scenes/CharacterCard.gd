extends BaseCard

class_name CharacterCard

signal enemy_down
signal turn_played
signal enemy_turn_played

var HP = 100

func _ready():
	can_highlight = false
	set_name("Character Name")
	set_game("Game")
	set_character_description("Character Description")
	set_HP(HP)

func set_name(ability):
	set_title(ability)

func set_game(character):
	set_subtitle(character)

func set_character_description(description):
	set_description(description)

func set_HP(newHP):
	set_count(newHP)

func take_damage(n):
	HP -= n
	if HP <= 0:
		emit_signal("enemy_down", self)
		queue_free()
	set_HP(HP)

func play(player):
	attack(player, 1)
	print_debug("attack player", 1)
	emit_signal("turn_played")
	emit_signal("enemy_turn_played")

func attack(player, points):
	player.take_damage(points)