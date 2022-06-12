extends PanelContainer
class_name NarrativeBox

var slide_in : String = "narrative_slidein"
var displayed : bool = false
# 1. The box pops up whenever you EXAMINE an item

# 2. The box hides the Sylladex and ItemName promts (so the Deck)

# 3. When you click and the box is active, it goes back to being not active (play anim in reverse)

# 4. The box appears AFTER pathfinding has reached its destination (the player must be idle) 

func play_with_text(text: String):
	$Label.set_text(text)
	$AnimationPlayer.play(slide_in)
	displayed = true

# Text animation
# Make a Tween Node
# Tween the "percent_visible" property
# Stop the tween every time you hit a period in a sentence
# Wait a bit
# Animate further
