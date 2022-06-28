extends Resource
class_name Event

signal can_proceeds

enum EventFlags { 
	AWAIT_INPUT = 1, 
	ONE_SHOT = 2, 
	CHAIN_BREAK = 4 }
export (EventFlags, FLAGS) var flags

func exec():
	pass
