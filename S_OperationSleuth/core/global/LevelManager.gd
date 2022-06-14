extends Node

var levels = []
var last_level : Level

# Logic called on game load.
func _ready() -> void:
	pass

# Logic called on scene load.
func _setup(level: Level):
	match_player_position(last_level, level.relations)
	
	InterfaceManager.transition(true)
	InterfaceManager.clear_display()

# Logic called on scene deload.
func _cleanup(level: Level):
	last_level = level
# This call is super important (DO NOT REMOVE)
	GameManager     .clear_nonpersistent()
	InterfaceManager.transition(false)
	
func match_player_position(old_level: Level, level_relations: Array):
	pass
