extends Node2D
class_name Level

export (int) var id
export (Array, int) var relations

func _ready():
<<<<<<< HEAD
	# Setup for LevelManager functions
	connect("tree_exiting", LevelManager, "_cleanup", [self])
	connect("ready", LevelManager, "_setup", [self])

=======
	# This is used to clean up all the junk on interfaces and in logic
	# Remove it and suddenly levels bleed into each other
	connect("tree_exiting", EventManager, "_on_tree_exiting")
	connect("tree_exiting", InterfaceManager, "_on_tree_exiting")
>>>>>>> 0a10f4d (Initial commit)
