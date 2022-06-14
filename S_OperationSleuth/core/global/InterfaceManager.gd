extends CanvasLayer

onready var narrative_box : NarrativeBox = $NarrativeBox 
var slide_in : String = "narrative_slidein"
var displayed : bool = false

var bb_code_template = "[color=#333]>  [/color][u]%s[/u]"

func set_command(text: String) -> void:
	$Deck/ItemName.set_bbcode(
		bb_code_template % text if text else "[color=#333]>  [/color]")

func play_with_text(text):
	if !text:
		return
	$NarrativeBox/Label.set_text(text)
	$AnimationPlayer.play(slide_in)
	displayed = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && displayed:
		$AnimationPlayer.play("RESET")
		displayed = false
		GameManager.selected_object = null

# These methods are going to be used to play a fancy animation between level switches
func transition(play_backwards: bool):
	print($AnimationPlayer.get_current_animation())

func clear_display():
	set_command("")
	$AnimationPlayer.play("RESET")

func _on_mouse_entered(object: InteractiveObject):
	set_command(object.get_hover_text())

func _on_mouse_exited(object: InteractiveObject):
	set_command("")
