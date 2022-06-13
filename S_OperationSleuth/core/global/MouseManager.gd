extends Node

# preload all cursors
const REGULAR = preload("res://Interface/Cursors/Regular.png")
const EXAMINE = preload("res://Interface/Cursors/Examine.png")
const CAPTCHA = preload("res://Interface/Cursors/Captcha.png")
const WALK = preload("res://Interface/Cursors/Walk.png")
const EXIT = preload("res://Interface/Cursors/Exit.png")

func set_cursor(type : int) -> void:
	match type:
		0:
			Input.set_custom_mouse_cursor(REGULAR)
		1:
			Input.set_custom_mouse_cursor(EXAMINE)
		2:
			Input.set_custom_mouse_cursor(CAPTCHA)
		3:
			Input.set_custom_mouse_cursor(WALK)
		4:
			Input.set_custom_mouse_cursor(EXIT)

func _ready() -> void:
	set_cursor(0)
