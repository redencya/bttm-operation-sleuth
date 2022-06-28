extends Area2D

var player : Player
var max_y : float
var min_y : float

func _ready() -> void:
	connect("body_entered", self, "_body_entered")
	connect("body_exited", self, "_body_exited")
	define_min_max($WorkingArea.get_polygon())

func define_min_max(points: Array):
	points.sort_custom(self, "_sort_by_y")
	min_y = points.pop_back().y
	max_y = points.pop_front().y

func _sort_by_y(a: Vector2, b: Vector2) -> bool:
	if a.y > b.y:
		return true
	return false

func _body_entered(body: Node) -> void:
	if body is Player:
		player = body
	
func _body_exited(body: Node) -> void:
	player = null

func _process(delta: float) -> void:
	if !player: return
	
	var mask_y = abs(max_y - player.global_position.y)
	var line_y = $Line2D.get_point_position(1).y - $Line2D.get_point_position(0).y
	player.set_elevation(mask_y + (mask_y / line_y) - 1)
