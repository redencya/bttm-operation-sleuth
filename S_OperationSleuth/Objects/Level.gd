extends Node2D
class_name Level

func _ready():
	# This is used to clean up all the junk on interfaces and in logic
	# Remove it and suddenly levels bleed into each other
	connect("tree_exiting", EventManager, "_on_tree_exiting")
	connect("tree_exiting", InterfaceManager, "_on_tree_exiting")
	
