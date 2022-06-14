extends CanvasLayer

onready var narrative_box : NarrativeBox = $NarrativeBox 
var slide_in : String = "narrative_slidein"
var displayed : bool = false

var bb_code_template = "[color=#333]>  [/color][u]%s[/u]"

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
		EventManager.selected_object = null

func _on_mouse_entered(object: InteractiveObject):
	set_command(object.get_hover_text())

func _on_mouse_exited(object: InteractiveObject):
	set_command("")

func _on_tree_exiting():
	set_command("")
	$NarrativeBox/AnimationPlayer.play("RESET")
