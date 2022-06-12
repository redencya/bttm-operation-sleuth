tool
extends Node

var levels : = {
	"bedroom" : "res://Levels/LevelBedroom.tscn",
	"hall" : "res://Levels/LevelHall.tscn"
}

var selected_item : InteractiveItem
onready var player : Player
var events_count = 3
var events : Dictionary = {
	"game_started" : true,
	"solved_puzzle1" : false,
	"solved_puzzle2" : false,
}

var sylladex_contents : Array = []

func _on_navigation_finished():
	print("finished")
	if GameManager.selected_item:
		match selected_item.hover_actions[selected_item.action_index]:
			InteractiveItem.CursorMode.EXAMINE:
				Interface.narrative_box.play_with_text(selected_item.description)
			InteractiveItem.CursorMode.ENTER:
				get_tree().change_scene(levels[selected_item.hover_text.to_lower()])
