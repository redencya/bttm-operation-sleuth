extends Node2D
class_name Level

export (NodePath) var player_path
export (int) var id
export (Dictionary) var relations
export (Dictionary) var exit_points

func _enter_tree() -> void:
	LevelManager    .match_player_position(relations, get_node(player_path))
	InterfaceManager.transition(true)

func _exit_tree() -> void:
	LevelManager    .set_last_level(id)
	EventManager    .clear_nonpersistent()
	InterfaceManager.clear_display()
	InterfaceManager.transition(false)
