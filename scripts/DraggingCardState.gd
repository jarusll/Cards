extends AbstractCardState

class_name DraggingCardState

func _on_mouse_entered():
	pass

func _on_mouse_exited():
	pass

func _on_gui_input(event):
	if event.is_action_released("left_click"):
		card_instance.transition_interactive()
	if event is InputEventMouseMotion:
		card_instance.position += event.position
		card_instance.position -= card_instance.sprite_size()