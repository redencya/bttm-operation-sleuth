extends Event
class_name EventSetCollide

signal change_property(target, name, new_value)

export (bool) var value
export (String) var property_name
export (NodePath) var target


func exec():
	emit_signal("change_property", target, property_name, value)
