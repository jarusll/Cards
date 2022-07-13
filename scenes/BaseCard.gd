extends Control

class_name BaseCard 

signal clicked(card)

var title_text = "Title"
var subtitle_text = "Subtitle"
var description_text = "Description"
var count_text: int = 0
var mouse_in = false
var can_highlight = true
var can_be_clicked = true
var highlighted = false
var can_grow = true

func _ready():
	$Interface/TitleLabel.set_text(title_text)
	$Interface/SubtitleLabel.set_text(subtitle_text)
	$Interface/DescriptionLabel.set_text(description_text)
	$Interface/CountLabel.set_text(String(count_text))
	$Highlight.hide()

func set_title(title):
	title_text = title
	$Interface/TitleLabel.set_text(title_text)

func set_subtitle(subtitle):
	subtitle_text = subtitle
	$Interface/SubtitleLabel.set_text(subtitle_text)

func set_description(description):
	description_text = description
	$Interface/DescriptionLabel.set_text(description_text)

func set_count(count):
	count_text = count
	$Interface/CountLabel.set_text(String(count_text))

func _on_Interface_mouse_entered():
	mouse_in = true
	if can_grow :
		set_scale(Vector2(1.05, 1.05))

func _on_Interface_mouse_exited():
	mouse_in = false
	if can_grow :
		set_scale(Vector2(1, 1))

func _on_Interface_gui_input(event: InputEvent):
	if can_be_clicked and (event is InputEventMouseButton) and event.is_pressed() and can_highlight:
		highlight()
		emit_signal("clicked", self)

func highlight():
	highlighted = true
	$Highlight.show()

func unhighlight():
	highlighted = false
	$Highlight.hide()

func reset_scale():
	set_scale(Vector2(1, 1))
