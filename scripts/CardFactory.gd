extends Node

class_name CardFactory

const AbilityCard = preload('res://scenes/AbilityCard.tscn')
const CharacterCard = preload('res://scenes/CharacterCard.tscn')

func make(type):
	if type == 'ability':
		return AbilityCard.instance()
	if type == 'character':
		return CharacterCard.instance()
	# return null
