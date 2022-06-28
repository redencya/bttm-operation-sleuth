extends KinematicBody2D
class_name Player

signal navigation_finished

export (NodePath) var nav_2d_path
export (float) var path_offset 

var velocity := Vector2.ZERO
export (float) var move_speed
var path = PoolVector2Array()
var direction : Vector2
var navigating := false

func _ready() -> void:
	connect("navigation_finished", EventManager, "_on_navigation_finished")

func _process(delta: float) -> void:
	if navigating:
		move_along_path(move_speed * delta)
	animate_stuff(direction)
	$CollisionShape2D.scale = $Sprite.scale

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		$Sprite/AnimationTree.get("parameters/playback").travel("Walk")
		create_path(event.position + Vector2(0, path_offset))
		navigating = true

func create_path(target : Vector2):
	path = get_node(nav_2d_path).get_simple_path(position, target)

func move_along_path(distance: float) -> void:
	var start_point := position
	for _i in range(path.size()):
		var distance_to_next := start_point.distance_to(path[0])
		direction = start_point.direction_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			direction = position.direction_to(path[0])
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif distance < 0.0:
			position = path[0]
			navigating = false
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
		if path.size() <= 0:
			emit_signal("navigation_finished")
			$Sprite/AnimationTree.get("parameters/playback").travel("Idle")

func animate_stuff(new_position : Vector2):
	$Sprite/AnimationTree.set("parameters/" + $Sprite/AnimationTree.get("parameters/playback").get_current_node() + "/blend_position", new_position)

func set_elevation(new_elevation: float):
	$Sprite.elevation = new_elevation
	print(new_elevation)
