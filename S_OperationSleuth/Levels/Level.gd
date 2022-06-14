extends Node2D
class_name Level

func _ready():
	# Setup for LevelManager functions
	connect("tree_exiting", LevelManager, "_cleanup")
	connect("tree_entered", LevelManager, "_setup")

