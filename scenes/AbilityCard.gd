extends BaseCard

signal player_card_played

var damage_points = 100
var original_position = get_position()
var focused_enemy

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var low = 5
	var high = 10
	set_damage_points(rng.randi_range(low, high))
	$DragLine.hide()
	pass

func set_position(new_position):
	.set_position(new_position)
	original_position = new_position

func transition_interactive():
	.transition_interactive()
	reset_drag()
	dismiss_focused_enemy()

func transition_hovering():
	state = HoveringCardState.new().set_card(self)

func _on_area_entered(area:Area2D):
	state._on_area_entered(area)

func _on_area_exited(area:Area2D):
	state._on_area_exited(area)

func prepare_to_attack(enemy):
	focused_enemy = enemy
	focused_enemy.about_to_be_attacked()

func dismiss_focused_enemy():
	if focused_enemy != null:
		focused_enemy.crisis_averted()
	focused_enemy = null

func hover_released():
	attack(focused_enemy)
	transition_interactive()

func attack(enemy):
	enemy.take_damage(damage_points)
	queue_free()
	emit_signal("player_card_played", self)

func set_damage_points(dp):
	damage_points = dp
	.set_count(damage_points)

func get_class():
	return "AbilityCard"

func drag_line(delta_position):
	reset_drag()
	$DragLine.add_point(Vector2.ZERO)
	$DragLine.add_point(Vector2(delta_position) - sprite_size() / 2)
	$DragArea/DragCollision.position = Vector2(delta_position) - sprite_size() / 2
	$DragLine.show()

func reset_drag():
	$DragLine.clear_points()
	$DragArea/DragCollision.position = Vector2.ZERO