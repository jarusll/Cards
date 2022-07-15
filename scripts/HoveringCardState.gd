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
		card_instance.drag(event.position - card_instance.sprite_size())

func _on_AbilityCard_area_entered(area:Area2D):
	if area.get_class() == "EnemyCard":
		card_instance.dismiss_focused_enemy()
		card_instance.prepare_to_attack(area)
	pass

func _on_AbilityCard_area_exited(area:Area2D):
	if area.get_class() == "EnemyCard":
		card_instance.dismiss_focused_enemy()
		# area.crisis_averted()
	pass
	card_instance.transition_dragging()