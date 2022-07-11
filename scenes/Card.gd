extends CanvasLayer
class_name Card 

var ability_name = "ability"
var character_name = "character"
var description_text = "description"

func _init():
	return 

func _ready():
	$AbilityLabel.set_text(ability_name)
	$CharacterLabel.set_text(character_name)
	$DescriptionLabel.set_text(description_text)

func set_ability(ability):
	ability_name = ability

func set_character(character):
	character_name = character

func set_description(description):
	description_text = description
