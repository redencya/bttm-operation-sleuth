extends CanvasLayer

onready var narrative_box : NarrativeBox = $NarrativeBox 

var bb_code_template = "[color=#333]>  [/color][u]Fran: %s.[/u]"

func set_command(text: String) -> void:
	$Deck/ItemName.set_bbcode(
		bb_code_template % text if text
		else "[color=#333]>  [/color]"
		)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && narrative_box.displayed:
		$NarrativeBox/AnimationPlayer.play("RESET")
		narrative_box.displayed = false
		GameManager.selected_item = null
		GameManager.player.path = PoolVector2Array()
