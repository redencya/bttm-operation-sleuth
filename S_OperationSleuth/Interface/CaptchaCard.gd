extends TextureRect
class_name CaptchaCard

var item_string_name : String
const DEFAULT_SCALE = Vector2.ONE
const HOVER_SCALE = DEFAULT_SCALE * 1.05

func _ready() -> void:
	connect("gui_input", self, "_on_gui_input")
	connect("mouse_exited", self, "_mouse_exited")

func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("interact"):
		CaptchaManager.current_card = item_string_name
	
	if event is InputEventMouseMotion:
		rect_scale = HOVER_SCALE
		if item_string_name:
			InterfaceManager.set_command("Use %s" % item_string_name)

func _mouse_exited():
	rect_scale = DEFAULT_SCALE
	if !CaptchaManager.current_card: InterfaceManager.set_command("")

func set_item_texture(new_texture: Texture):
	$Item.texture = new_texture

func clear_item_texture():
	$Item.texture = null
