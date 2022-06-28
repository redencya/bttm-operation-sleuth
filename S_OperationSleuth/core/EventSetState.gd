extends Event
class_name EventSetState

signal change_state(new_state)

export (NodePath) var new_state

func exec():
	emit_signal("change_state", new_state)
