tool
extends HBo

export (Color) var main_color

func set_label_color(color: Color):
	$Label.get("custom_style/normal").set_bg_color(color)

func _process(delta: float) -> void:
	if Engine.editor_hint:
		set_label_color(main_color)

