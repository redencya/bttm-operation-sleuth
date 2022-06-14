# DEPRECATED

tool
extends Node

var levels : = {
	"bedroom" : "res://Levels/LevelBedroom.tscn",
	"hall" : "res://Levels/LevelHall.tscn"
}

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

func _on_tree_exiting():
	# Clean-up to prevent fuckups between levels
	selected_object = null

func _on_navigation_finished():
	if !selected_object:
		return
	
	match selected_object.get_hover_cursor():
		ItemData.InteractionMode.EXAMINE:
			InterfaceManager.play_with_text(selected_object.get_dialogue(0))
		ItemData.InteractionMode.ENTER:
			get_tree().change_scene(levels[selected_object.name.to_lower()])
