# DEPRECATED

tool
extends Node

var selected_object : InteractiveObject
var events_count = 3
var events : Dictionary = {
	"solved_puzzle1" : false,
	"solved_puzzle2" : false,
	"solved_puzzle3" : false,
}

var sylladex_contents : Array = []

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int, object: InteractiveObject):
	if event.is_action_pressed("interact"):
		selected_object = object


func clear_persistent():
	pass
	
func clear_nonpersistent():
	selected_object = null
