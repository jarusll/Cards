extends Area2D
class_name Card 

var ability_name = "FRAG/ment"
var character_name = "KAY/O"
var description_text = "Explosive which bursts on sticking"

func _ready():
	$AbilityLabel.set_text(ability_name)
	$CharacterLabel.set_text(character_name)
	$DescriptionLabel.set_text(description_text)
	var screensize = get_viewport().get_visible_rect().size	
	position = Vector2(screensize.x/2, screensize.y/2)

func set_ability(ability):
	ability_name = ability

func set_character(character):
	character_name = character

func set_description(description):
	description_text = description
