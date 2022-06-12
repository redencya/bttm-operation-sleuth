tool
extends Sprite
class_name PerspectiveSprite

export (float) var global_scale_mod
export (NodePath) var grid

func _process(_delta: float) -> void:
	perspective_scale(get_node(grid).points)
	global_scale *= global_scale_mod

func perspective_scale(grid: PoolVector2Array):
	var scale_mod = get_rect().size.y
	match grid.size():
		1:
			var distance = abs(grid[0].y - global_position.y)
			global_scale = Vector2.ONE * (distance / scale_mod)
		2:
			var pt0 = grid[0]
			var pt1 = grid[1]
			var gpos = global_position
			
			var distance_y = pt0.y + (pt1.y - pt0.y) * (gpos.x - pt0.x) / (pt1.x - pt0.x)
			global_scale = Vector2.ONE * (abs(distance_y - gpos.y) / scale_mod)
