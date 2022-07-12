extends BaseCard

signal ability_clicked(ability)

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
	damage_points = points
	$Interface/DamagePoints.set_text(String(damage_points))

func use(CharacterCard):
	CharacterCard.damage(damage_points)	
	queue_free()

func _on_Interface_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.is_pressed():
		emit_signal("ability_clicked", self)

func highlight():
	$Highlight.show()

func unhighlight():
	$Highlight.hide()
