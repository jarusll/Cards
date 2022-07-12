extends Node

const CardFactory = preload('res://scripts/CardFactory.gd')

var selected_character 
var selected_ability

func _ready():
	for character in $Interface/Enemies.get_children():
		character.connect("character_clicked", self, "on_character_clicked")
	for character in $Interface/Cards.get_children():
		character.connect("ability_clicked", self, "on_ability_clicked")

func on_character_clicked(character):
	print_debug("char clicked")
	selected_character = character
	if selected_ability:
		selected_ability.use(selected_character)
	selected_ability = null
	selected_character = null

func on_ability_clicked(ability):
	print_debug("ability clicked")
	if selected_ability:
		selected_ability.unhighlight()
	selected_ability = ability
	ability.highlight()
