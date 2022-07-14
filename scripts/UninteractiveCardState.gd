extends AbstractCardState

class_name UninteractiveCardState

func _on_mouse_entered():
	pass

func _on_mouse_exited():
	pass

func _on_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		card_instance.transition_highlight()
	pass
