tool
extends Area2D
class_name InteractiveObject

export (Resource) var item_data_stateless
export (Dictionary) var item_data_stateful
export var refresh_states : bool

func _ready() -> void:
	# Logic that gets delegated to Managers
	connect("mouse_entered", InterfaceManager, "_on_mouse_entered", [self])
	connect("mouse_exited", InterfaceManager, "_on_mouse_exited", [self])
	connect("input_event", GameManager, "_on_input_event", [self])

func _process(_delta: float) -> void:
	# QoL, the script will automatically resize the events pile
	if Engine.editor_hint:
		if !item_data_stateless:
			item_data_stateless = ItemData.new()
		if !item_data_stateful || refresh_states:
			for i in range(0, GameManager.events.size()):
				item_data_stateful[GameManager.events.keys()[i]] = item_data_stateless.duplicate(true)
			refresh_states = false
			print("states refreshed!")

func _pick_dataset(state: String) -> ItemData:
	if !state:
		return item_data_stateless as ItemData
	return item_data_stateful[state] as ItemData

func get_dialogue(idx: int):
	var dataset = _pick_dataset("")
	if idx < dataset.dialogue_bank.size():
		return dataset.dialogue_bank[idx]

func get_hover_text() -> String:
	# There should be a value here but it's just testing rn
	var dataset = _pick_dataset("")
	var action_name : String = dataset.get_action_name(0).capitalize()
	var item_name : String = dataset.name
	var template = "Fran: %s %s."
	
	return template % [action_name, item_name]

func get_hover_cursor() -> int:
	var dataset = _pick_dataset("")
	return dataset.primary_interaction as int
