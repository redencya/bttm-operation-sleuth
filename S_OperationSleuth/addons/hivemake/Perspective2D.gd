tool
extends Node2D
class_name Perspective2D

export (float, -180, 180) var rotation_offset
export (float, 1, 30) var preview_cone_size
export var points = PoolVector2Array()

const GRID_ELEMENT_SIZE = 150

func _draw() -> void:
	for point in points:
		draw_grid(point)

func draw_grid_element(pos: Vector2, direction: Vector2):
	draw_line(pos, pos * direction * GRID_ELEMENT_SIZE, Color("#fe2733"))

func draw_grid(pos: Vector2):
	var grid_element_count = floor(360 / preview_cone_size)
	for i in grid_element_count:
		var angle_to_rotate = preview_cone_size * i
		var direction = Vector2.UP.rotated(deg2rad(angle_to_rotate + rotation_offset))
		draw_grid_element(pos, direction)
