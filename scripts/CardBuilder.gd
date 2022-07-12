extends Node

class_name CardBuilder

const BaseCard = preload('res://scenes/BaseCard.tscn')
var card_instance

func build():
	card_instance = BaseCard.instance()
	return self

func with_title(title):
	card_instance.set_title(title)
	return self

func with_subtitle(subtitle):
	card_instance.set_subtitle(subtitle)
	return self

func with_description(description):
	card_instance.set_description(description)
	return self

func get_card():
	return card_instance
