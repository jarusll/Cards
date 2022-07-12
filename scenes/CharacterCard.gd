extends BaseCard

func _ready():
	set_name("Character Name")
	set_game("Game")
	set_character_description("Character Description")

func set_name(ability):
	set_title(ability)

func set_game(character):
	set_subtitle(character)

func set_character_description(description):
	set_description(description)
