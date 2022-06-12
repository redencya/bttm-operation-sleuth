tool
extends PerspectiveSprite
class_name InteractiveItem

enum CursorMode { REGULAR, EXAMINE, CAPTCHA, WALK, ENTER }

export (bool) var pickup
export (String) var hover_text
export (Array, CursorMode) var hover_actions
export (Array, String, MULTILINE) var descriptions

var action_index = 0

func _process(delta: float) -> void:
	if Engine.editor_hint:
		descriptions.resize(GameManager.events.size())
		$Collider/CollisionShape2D.get_shape().set_height(get_rect().size.y/2)
		$Collider/CollisionShape2D.get_shape().set_radius(get_rect().size.x/2)
		
func _ready() -> void:
	$Collider/CollisionShape2D.connect("input_event", self, "_on_Area2D_input_event")
	$Collider/CollisionShape2D.connect("mouse_entered", self, "_on_Area2D_mouse_entered")
	$Collider/CollisionShape2D.connect("mouse_exited", self, "_on_Area2D_mouse_exited")

func _on_Area2D_mouse_entered() -> void:
	MouseManager.set_cursor(hover_actions[action_index])
	Interface.set_command(str(CursorMode.keys()[hover_actions[action_index]].capitalize()) + " " + hover_text)

func _on_Area2D_mouse_exited() -> void:
	MouseManager.set_cursor(0)
	Interface.set_command("")
	
func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("interact"):
		GameManager.selected_item = self
