extends BaseCard

signal player_turn_played

class_name AbilityCard

var damage_points = 30

func _ready():
	set_ability("Ability Name")
	set_character("Character Name")
	set_ability_description("Ability Description")
	set_damage_points(damage_points)

func set_ability(ability):
	set_title(ability)

func set_character(character):
	set_subtitle(character)

func set_ability_description(description):
	set_description(description)

func set_damage_points(points):
	set_count(points)

func use(character_card):
	character_card.take_damage(damage_points)	
	emit_signal("player_turn_played")
