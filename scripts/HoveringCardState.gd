extends AbstractCardState

class_name HoveringCardState

func _on_mouse_entered():
	pass

func _on_mouse_exited():
	card_instance.transition_interactive()
	pass

func _on_gui_input(event):
	if event.is_action_released("left_click"):
		card_instance.hover_released()
	if event is InputEventMouseMotion:
		card_instance.drag_line(event.position)

func _on_area_entered(_area:Area2D):
	pass 

func _on_area_exited(area:Area2D):
	if area.get_class() == "EnemyCard":
		card_instance.transition_dragging()
		card_instance.dismiss_focused_enemy()
