tool
extends EditorPlugin

var perspective_2d : Perspective2D

func _enter_tree() -> void:
	add_custom_type("Perspective2D", "Node2D", preload("res://addons/hivemake/Perspective2D.gd"), preload("res://addons/hivemake/icon.svg"))

func edit(object: Object) -> void:
	perspective_2d = object

func handles(object: Object) -> bool:
	return object is Perspective2D

func forward_canvas_draw_over_viewport(overlay: Control) -> void:
	if !(perspective_2d || perspective_2d.is_inside_tree()):
		return
		
	draw_controls(overlay)
	draw_perspective_preview(overlay)
	
func draw_controls(overlay: Control):
	pass
	
func draw_perspective_preview(overlay: Control):
	pass
	
func _exit_tree() -> void:
	remove_custom_type("Perspective2D")
