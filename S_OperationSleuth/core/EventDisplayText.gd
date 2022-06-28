extends Event
class_name EventDisplayText

enum AnimationTransitions { 
	ENTER = 1, 
	EXIT = 2
	}
export (AnimationTransitions, FLAGS) var transitions 
export (String, MULTILINE) var text

func exec():
	InterfaceManager.play_with_text(text, transitions)
