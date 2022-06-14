extends Node

var levels = []
var last_level : Level setget set_last_level

func set_last_level(new_level: Level) -> void:
	last_level = new_level

# Logic called on game load.
func _ready() -> void:
	serialize_levels()

func match_player_position(relations: Dictionary):
	# if we dont know of the connection we ollie the f out
	if !(last_level in relations.keys()): return
	# okay so this won't work until there's a player reference
	# and putting in a player reference in HERE would be 
	# jank as hell, so we're gonna postpone this woooo
	
func serialize_levels() -> void:
	pass
