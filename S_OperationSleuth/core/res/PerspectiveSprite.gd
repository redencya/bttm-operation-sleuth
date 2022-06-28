tool
extends Sprite
class_name PerspectiveSprite

export (float) var global_scale_mod
export (NodePath) var grid
export (float) var elevation = 0

func _process(_delta: float) -> void:
	perspective_scale(get_node(grid).points)
	global_scale *= global_scale_mod

func perspective_scale(p_grid: PoolVector2Array):
	var scale_mod = get_rect().size.y
	match p_grid.size():
		1:
			var distance = abs(p_grid[0].y - (global_position.y + elevation))
			global_scale = Vector2.ONE * (distance / scale_mod)
		2:
			var pt0 = p_grid[0]
			var pt1 = p_grid[1]
			var gpos = global_position
			
			var distance_y = pt0.y + (pt1.y - pt0.y) * (gpos.x - pt0.x) / (pt1.x - pt0.x)
			global_scale = Vector2.ONE * (abs(distance_y - gpos.y) / scale_mod)
