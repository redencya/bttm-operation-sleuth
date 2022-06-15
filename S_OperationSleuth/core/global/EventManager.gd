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

func _on_navigation_finished():
	if !selected_object:
		return
	
	match selected_object.get_hover_cursor():
		ItemData.InteractionMode.EXAMINE:
			InterfaceManager.play_with_text(selected_object.get_dialogue(0))
		ItemData.InteractionMode.ENTER:
			if !("exits_to" in selected_object.get_bonus_values().keys()): return
			LevelManager.switch_to(selected_object.get_bonus_values()["exits_to"])

func clear_persistent():
	pass
	
func clear_nonpersistent():
	selected_object = null
