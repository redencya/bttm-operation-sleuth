extends Area2D
class_name InterActor

onready var state_machine : StateMachine = $StateMachine

func _ready() -> void:
	connect("mouse_entered", self, "_request_hover_action")
	connect("mouse_exited", self, "_clear_hover_action")
	connect("input_event", self, "_request_click_action")
	
func _clear_hover_action():
	InterfaceManager.set_command("")
	
func _request_click_action(viewport: Object, event: InputEvent, shape_idx: int):
	if event is InputEventMouseMotion:
		state_machine._on_hover()	
	if event.is_action_pressed("interact"):
		state_machine._on_clicked()
