extends AbstractCardState

class_name HoveringCardState

func _on_mouse_entered():
	pass

func _on_mouse_exited():
	pass

func _on_gui_input(event):
	if event.is_action_released("left_click"):
		card_instance.hover_released()
	if event is InputEventMouseMotion:
		card_instance.drag(event.position - card_instance.sprite_size())
