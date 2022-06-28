extends TextureRect
class_name CaptchaCard

var item_string_name : String

func _ready() -> void:
	connect("gui_input", self, "_on_gui_input")
	connect("mouse_exited", self, "_mouse_exited")

func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("interact"):
		print(item_string_name)
		
	if event is InputEventMouseMotion && item_string_name:
		InterfaceManager.set_command("Use %s" % item_string_name)

func _mouse_exited():
	InterfaceManager.set_command("")

func set_item_texture(new_texture: Texture):
	$Item.texture = new_texture

func clear_item_texture():
	$Item.texture = null
