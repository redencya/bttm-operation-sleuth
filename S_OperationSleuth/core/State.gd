tool
extends Node
class_name State

export (Resource) var clicked
export (Resource) var exit_logic
export (Resource) var enter_logic
export (Array, Resource) var item_interactions
export (String) var hover_prompt
export (String) var item_name

var state_machine

func _exit():
	for event in exit_logic.events:
		if event is EventSetState:
			event.connect("change_state", self, "_change_state", [], CONNECT_REFERENCE_COUNTED)
		if event is EventSetCollide:
			event.connect("change_property", self, "_change_property", [], CONNECT_REFERENCE_COUNTED)
	exit_logic.play_events()
		
func _enter():
	for event in enter_logic.events:
		if event is EventSetState:
			event.connect("change_state", self, "_change_state", [], CONNECT_REFERENCE_COUNTED)
		if event is EventSetCollide:
			event.connect("change_property", self, "_change_property", [], CONNECT_REFERENCE_COUNTED)
	enter_logic.play_events()
	
func _clicked(item):
	if !item: 
		for event in clicked.events:
			if event is EventSetState:
				event.connect("change_state", self, "_change_state", [], CONNECT_REFERENCE_COUNTED)
			if event is EventSetCollide:
				event.connect("change_property", self, "_change_property", [], CONNECT_REFERENCE_COUNTED)
		clicked.play_events()

func _change_state(new_state: NodePath) -> void:
	state_machine.set_state_from_node(get_node(new_state))

func _change_property(target: NodePath, property: String, value: bool):
	var node = get_node(target)
	node.set(property, value)
	
func _hovered(item):
	if !item: 
		InterfaceManager.set_command("%s %s." % [hover_prompt, item_name])
	
func _item_used(item: Item):
	for action in item_interactions:
		if action.item == item: action.run()

func _process(delta: float) -> void:
	# This is jank as fuck, but it works!
	if !clicked: clicked = load("res://core/default_events/eventSheet.tres").duplicate(true)
	elif clicked.add_new_event: add_event(clicked)
		
	if !exit_logic: exit_logic = load("res://core/default_events/eventSheet.tres").duplicate(true)
	elif exit_logic.add_new_event: add_event(exit_logic)

	if !enter_logic: enter_logic = load("res://core/default_events/eventSheet.tres").duplicate(true)
	elif enter_logic.add_new_event: add_event(enter_logic)

func add_event(resource):
	match resource.new_event_type:
		EventSheet.EventTypes.SET_STATE:
			resource.events.append(load("res://core/default_events/eventSetState.tres").duplicate())
		EventSheet.EventTypes.SET_COLLIDE:
			resource.events.append(load("res://core/default_events/eventSetCollide.tres").duplicate())
		EventSheet.EventTypes.SET_ITEM:
			resource.events.append(load("res://core/default_events/eventSetItem.tres").duplicate())
		EventSheet.EventTypes.DISPLAY_TEXT:
			resource.events.append(load("res://core/default_events/eventDisplayText.tres").duplicate())
		EventSheet.EventTypes.DISPLAY_ANIMATION:
			print("Not supported yet!")
	resource.add_new_event = false
	return
