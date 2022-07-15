extends Area2D

func _ready():
	pass # Replace with function body.

func _on_DragArea_area_entered(area:Area2D):
	if area.get_class() == "EnemyCard":
		area.about_to_be_attacked()
	pass # Replace with function body.
