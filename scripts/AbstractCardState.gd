extends Node

class_name AbstractCardState

var card_instance

func set_card(card):
    card_instance = card
    return self

func get_card():
    return card_instance

func _on_mouse_entered():
    assert(false)

func _on_mouse_exited():
    assert(false)

func _on_gui_input(_event):
    assert(false)
