extends Node
class_name StateMachine

var states : Dictionary
export (NodePath) var default_state
var current_state : State

func _ready() -> void:
	for child in get_children():
		child.state_machine = self
		states[child.name] = child
	if default_state:
		current_state = get_node(default_state)
	else:
		current_state = get_children()[0]

func set_state_from_node(new_state: State) -> void:
	current_state._exit()
	current_state = new_state
	current_state._enter()

func set_state_from_string(new_state: String):
	if !(new_state in states.keys()): return
	
	current_state._exit()
	current_state = states[new_state]
	current_state._enter()

func get_state() -> String:
	return current_state.name

func _on_clicked():
	current_state._clicked(CaptchaManager.current_card)

func _on_hover():
	current_state._hovered(CaptchaManager.current_card)

func _on_item_used(item: Item):
	current_state._item_used(item)
