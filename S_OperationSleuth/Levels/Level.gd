extends Node2D
class_name Level

export (int) var id
export (Dictionary) var relations

func _enter_tree() -> void:
	LevelManager    .match_player_position(relations)
	InterfaceManager.transition(true)
	InterfaceManager.clear_display()

func _exit_tree() -> void:
	LevelManager    .set_last_level(self)
	EventManager    .clear_nonpersistent()
	InterfaceManager.transition(false)
