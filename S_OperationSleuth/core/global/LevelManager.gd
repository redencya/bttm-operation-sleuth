extends Node

var levels = []
var last_level : int setget set_last_level

func set_last_level(new_level: int) -> void:
	last_level = new_level

func _enter_tree() -> void:
	serialize_levels()

func match_player_position(relations: Dictionary, player: Player):
	# if we dont know of the connection we ollie the f out
	if !last_level:
		return
	if !(last_level in relations.keys()): 
		print("Failed to locate ", last_level)
		return
	var relation_dict = relations[last_level]
	player.global_position = relation_dict["position"]
	player.set_flip_h(relation_dict["flipped"])

func switch_to(idx: int) -> void:
	get_tree().change_scene_to(levels[idx])

func serialize_levels() -> void:
	var dir = Directory.new()
	if dir.open("res://Levels") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				levels.append(load("res://Levels/" + file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
