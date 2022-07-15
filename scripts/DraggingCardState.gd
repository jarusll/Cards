extends AbstractCardState

class_name DraggingCardState

func _on_mouse_entered():
	pass

func _on_mouse_exited():
	pass

func _on_gui_input(event):
	if card_instance.get_class() == "AbilityCard":
		if event.is_action_released("left_click"):
			card_instance.transition_interactive()
		if event is InputEventMouseMotion:
			card_instance.drag_line(event.position)

func _on_area_entered(area:Area2D):
	if area.get_class() == "EnemyCard":
		card_instance.transition_hovering()
		card_instance.prepare_to_attack(area)

func _on_area_exited(_area:Area2D):
	pass
