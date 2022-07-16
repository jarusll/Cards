extends Area2D

class_name BaseCard 

var count_text
var state

func _ready():
	# position = get_viewport().get_visible_rect().size / 2
	set_count(0)
	transition_interactive()

func get_position():
	return position

func set_position(new_position):
	position = new_position

func set_state(new_state):
	state = new_state

func set_count(count):
	count_text = count
	$UI/Count.set_text(String(count_text))

func _on_mouse_entered():
	state._on_mouse_entered()

func _on_mouse_exited():
	state._on_mouse_exited()

func _on_gui_input(event: InputEvent):
	state._on_gui_input(event)

func transition_uninteractive():
	state = UninteractiveCardState.new().set_card(self)
	$Highlight.hide()

func transition_interactive():
	state = InteractiveCardState.new().set_card(self)
	$Highlight.hide()

func transition_highlight():
	state = HighlightedCardState.new().set_card(self)
	$Highlight.show()

func transition_dragging():
	state = DraggingCardState.new().set_card(self)
	$Highlight.show()

func sprite_size():
	return ($Sprite.get_rect().size * $Sprite.scale)

func get_width():
	return $Sprite.get_rect().size.x * $Sprite.scale.x

func get_dimension():
	return $Sprite.get_rect().size
