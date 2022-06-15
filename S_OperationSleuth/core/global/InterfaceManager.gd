extends CanvasLayer

onready var narrative_box : NarrativeBox = $NarrativeBox 
var slide_in : String = "narrative_slidein"
var displayed : bool = false

var bb_code_template = "[color=#333]>  [/color][u]%s[/u]"

const REGULAR = preload("res://Interface/Cursors/Regular.png")
const EXAMINE = preload("res://Interface/Cursors/Examine.png")
const CAPTCHA = preload("res://Interface/Cursors/Captcha.png")
const WALK = preload("res://Interface/Cursors/Walk.png")
const EXIT = preload("res://Interface/Cursors/Exit.png")

func _ready() -> void:
	set_cursor(0)

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

func set_command(text: String) -> void:
	$Deck/ItemName.set_bbcode(
		bb_code_template % text if text
		else "[color=#333]>  [/color]"
		)

func play_with_text(text):
	if !text:
		return
	$NarrativeBox/Label.set_text(text)
	$NarrativeBox/AnimationPlayer.play(slide_in)
	displayed = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && displayed:
		$NarrativeBox/AnimationPlayer.play("RESET")
		displayed = false
		GameManager.selected_object = null

func _on_mouse_entered(object: InteractiveObject):
	set_command(object.get_hover_text())
	set_cursor(object.get_hover_cursor())

func _on_mouse_exited(object: InteractiveObject):
	set_command("")
	set_cursor(0)

func _on_tree_exiting():
	set_command("")
	set_cursor(0)
	$NarrativeBox/AnimationPlayer.play("RESET")
