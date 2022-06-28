tool
extends VBoxContainer

const CARD_BLANK = preload("res://Interface/CaptchaCard.tscn")

# Focus on Top / Bottom, and do Left / Right later
enum SylladexPosition { BOTTOM, TOP, LEFT, RIGHT }
export (SylladexPosition) var sylladex_position
export (Array, Resource) var inventory
export (int) var card_size
var last_card_size : int
export (Color) var main_color
export (Color) var text_color

func _process(delta: float) -> void:
	set_main_color($Header, main_color)
	set_main_panel_color($CardContainer, main_color.lightened(0.2))

func set_main_color(node: Node, color: Color):
	var custom_style = node.get("custom_styles/normal")
	custom_style.bg_color = color

func set_main_panel_color(node: Node, color: Color):
	var custom_style = node.get("custom_styles/panel")
	custom_style.bg_color = color

func _on_card_captchalogued() -> void:
	pass
