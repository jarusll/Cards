extends BaseCard

var character_trait = Character.new()

func _ready():
	pass # Replace with function body.

func _on_CharacterCard_area_entered(area:Area2D):
	print_debug(area, "entered in character")
	pass # Replace with function body.
