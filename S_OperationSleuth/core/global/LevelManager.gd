extends Node

var levels = []
var last_level : Level

# Logic called on game load.
func _ready() -> void:
	pass

# Logic called on scene load.
func _setup(level: Level):
	match_player_position(last_level, level.relations)

# Logic called on scene deload.
func _cleanup(level: Level):
	GameManager.selected_object = null
	last_level = level
	
func match_player_position(old_level: Level, level_relations: Array):
	pass
