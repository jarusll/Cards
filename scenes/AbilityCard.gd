extends BaseCard

func _ready():
	set_ability("Ability Name")
	set_character("Character Name")
	set_ability_description("Ability Description")

func set_ability(ability):
	set_title(ability)

func set_character(character):
	set_subtitle(character)

func set_ability_description(description):
	set_description(description)
