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
		card_instance.drag_line(event.position)

func _on_AbilityCard_area_entered(area: Area2D):
	if area.get_class() == "EnemyCard":
		card_instance.prepare_to_attack(area)
	card_instance.transition_hovering()

func _on_AbilityCard_area_exited(area:Area2D):
	if area.get_class() == "EnemyCard":
		area.crisis_averted()
	card_instance.transition_dragging()
