extends Resource
class_name ItemData

enum InteractionMode { NONE, EXAMINE, CAPTCHA, WALK, EXIT }

export (String) var name
export (Array, String, MULTILINE) var dialogue_bank

export (Array, InteractionMode) var interaction_bank
