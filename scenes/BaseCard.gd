extends Control

class_name BaseCard 

var title_text = "Title"
var subtitle_text = "Subtitle"
var description_text = "Description"
var mouse_in = false
var highlighted = false

func _ready():
	$Interface/TitleLabel.set_text(title_text)
	$Interface/SubtitleLabel.set_text(subtitle_text)
	$Interface/DescriptionLabel.set_text(description_text)
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

func _on_Interface_mouse_entered():
	mouse_in = true
	set_scale(Vector2(1.2, 1.2))

func _on_Interface_mouse_exited():
	mouse_in = false
	set_scale(Vector2(1, 1))
