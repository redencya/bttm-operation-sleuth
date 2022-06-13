extends Resource
class_name ItemData

enum InteractionMode { NONE, EXAMINE, CAPTCHA, WALK, ENTER }
# Simple string data for UI displays.
export (String) var name
export (Array, String, MULTILINE) var dialogue_bank
# LMB and RMB based interactions, used to reduce amount of boolean logic.
export (InteractionMode) var primary_interaction
export (InteractionMode) var secondary_interaction
export (Dictionary) var bonus_values

func get_dialogue(idx: int) -> String:
	if idx > dialogue_bank: return ""
	return dialogue_bank[idx]

func get_action_name(idx: int) -> String:
	match idx:
		0:
			return str(InteractionMode.keys()[primary_interaction])
		1:
			return str(InteractionMode.keys()[secondary_interaction])
	return ""
