extends Node2D
class_name Level

export (int) var id
export (Array, int) var relations

func _ready():
	# Setup for LevelManager functions
	connect("tree_exiting", LevelManager, "_cleanup", [self])
	connect("ready", LevelManager, "_setup", [self])

