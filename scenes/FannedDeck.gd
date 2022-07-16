extends Deck

class_name FannedDeck

func _ready():
	pass # Replace with function body.

func _draw():
	var child_count = get_child_count()
	if child_count > 0:
		# cards are centered so left half of left most & right half of right most child will 
		# be counted in total width
		# left half + right half of a child = 1 child_width
		# thus subtracting 1 child_width
		var child_width = get_child(0).get_width()
		var total_width = (child_count * child_width) - child_width
		var half_width = total_width / 2

		var center = Vector2.ZERO
		var left_most_position = center - Vector2(half_width, 0)
		for child in get_children():
			child.set_position(left_most_position)
			left_most_position += Vector2(child_width, 0)
