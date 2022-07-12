extends BaseCard

signal character_clicked(character)

var HP = 100

func _ready():
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
	HP = newHP	
	$Interface/HPLabel.set_text(String(newHP))

func damage(n):
	HP -= n
	if HP <= 0:
		queue_free()
	set_HP(HP)

func _on_Interface_gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.is_pressed():
		emit_signal("character_clicked", self)
