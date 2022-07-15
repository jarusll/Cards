extends BaseCard

var damage_points = 10
var original_position = get_position()
var focused_enemy

func _ready():
	set_damage_points(damage_points)
	$DragLine.hide()
	pass

func set_position(new_position):
	.set_position(new_position)
	original_position = new_position

func transition_interactive():
	print_debug("interactive")
	.transition_interactive()
	reset_drag()
	# position = original_position

func transition_hovering():
	print_debug("hovering")
	reset_drag()
	state = HoveringCardState.new().set_card(self)

func _on_AbilityCard_area_entered(area:Area2D):
	state._on_AbilityCard_area_entered(area)

func _on_AbilityCard_area_exited(area:Area2D):
	state._on_AbilityCard_area_exited(area)

func prepare_to_attack(enemy):
	focused_enemy = enemy
	focused_enemy.about_to_be_attacked()

func dismiss_focused_enemy():
	if focused_enemy != null:
		focused_enemy.crisis_averted()
	focused_enemy = null

func hover_released():
	transition_interactive()
	# if focused_enemy:
	# 	self.attack(focused_enemy)
	# 	queue_free()
	# else:
	# 	transition_interactive()
	# 	print_debug("hover released")

func attack(enemy):
	enemy.take_damage(damage_points)

func set_damage_points(dp):
	damage_points = dp
	.set_count(damage_points)

func get_class():
	return "AbilityCard"

func _on_DragArea_area_entered(area:Area2D):
	pass # Replace with function body.

func drag_line(delta_position):
	$DragLine.clear_points()
	$DragLine.add_point(Vector2.ZERO)
	$DragLine.add_point(Vector2(delta_position) - sprite_size())
	$DragLine/DragArea.position = Vector2(delta_position) - sprite_size()
	$DragLine.show()

func reset_drag():
	$DragLine.clear_points()