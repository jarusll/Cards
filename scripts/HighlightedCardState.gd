extends AbstractCardState

class_name HighlightedCardState

func _on_mouse_entered():
	card_instance.set_scale(Vector2(1, 1))

func _on_mouse_exited():
	card_instance.set_scale(Vector2(1, 1))

func _on_gui_input(event):
    if event.is_action_released("left_click"):
        card_instance.transition_interactive()
    if event is InputEventMouseMotion:
        card_instance.transition_dragging()