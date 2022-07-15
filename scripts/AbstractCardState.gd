extends Node

class_name AbstractCardState

var card_instance

func set_card(card):
    card_instance = card
    return self

func get_card():
    return card_instance

func _on_mouse_entered():
    pass

func _on_mouse_exited():
    pass

func _on_gui_input(_event):
    pass

func _on_area_entered(_area:Area2D):
	pass 

func _on_area_exited(_area:Area2D):
    pass