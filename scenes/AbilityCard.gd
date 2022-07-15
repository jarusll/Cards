extends BaseCard

var damage_points = 10
var original_position = position
var focused_enemy

func _ready():
	set_damage_points(damage_points)
	pass

func transition_interactive():
	.transition_interactive()
	position = original_position

func transition_hovering():
	state = HoveringCardState.new().set_card(self)

func _on_AbilityCard_area_entered(area:Area2D):
	print_debug(area.get_class())
	if area.get_class() == "EnemyCard":
		focused_enemy = area
		area.about_to_be_attacked()
		self.transition_hovering()

func _on_AbilityCard_area_exited(area:Area2D):
	if area.get_class() == "EnemyCard":
		focused_enemy = null
		area.crisis_averted()
		self.transition_highlight()

func hover_released():
	if focused_enemy:
		self.attack(focused_enemy)
		queue_free()
	else:
		transition_interactive()
		print_debug("hover released")

func attack(enemy):
	enemy.take_damage(damage_points)

func set_damage_points(dp):
	damage_points = dp
	.set_count(damage_points)

func get_class():
	return "AbilityCard"
