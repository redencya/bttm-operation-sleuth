tool
extends VBoxContainer

const CARD_BLANK = preload("res://Interface/CaptchaCard.tscn")

# Focus on Top / Bottom, and do Left / Right later
enum SylladexPosition { BOTTOM, TOP, LEFT, RIGHT }
export (SylladexPosition) var sylladex_position
export (int) var card_size
var last_card_size : int
export (Color) var main_color
export (Color) var text_color

func _process(delta: float) -> void:
	set_main_color($Header, main_color)
	set_main_panel_color($CardContainer, main_color.lightened(0.2))
	set_card_sizes()

func set_main_color(node: Node, color: Color):
	var custom_style = node.get("custom_styles/normal")
	custom_style.bg_color = color

func set_main_panel_color(node: Node, color: Color):
	var custom_style = node.get("custom_styles/panel")
	custom_style.bg_color = color

func set_card_sizes() -> void:
	refresh_cards()
	for _i in card_size:
		set_card_size()

func refresh_cards():
	var card_deck = $CardContainer/CardDeck
	if card_deck.get_children().size() != last_card_size:
		for child in card_deck.get_children():
			child.queue_free()

func set_card_size() -> void:
	var captchacard = CARD_BLANK.instance()
	var card_deck = $CardContainer/CardDeck
	
	card_deck.add_child(captchacard)
