extends Resource
class_name EventSheet

enum EventTypes { 
	SET_STATE, 
	SET_COLLIDE, 
	SET_ITEM,
	DISPLAY_TEXT, 
	DISPLAY_ANIMATION,
	}

const ONE_SHOT = Event.EventFlags.ONE_SHOT
const CHAIN_BREAK = Event.EventFlags.CHAIN_BREAK
const AWAIT_INPUT = Event.EventFlags.AWAIT_INPUT

export (EventTypes) var new_event_type
export (bool) var add_new_event
export (Array, Resource) var events

func play_events():
	var i = 0
	while i < events.size():
		var flags = events[i].flags 
		events[i].exec()
		if flags & AWAIT_INPUT:
			yield(InterfaceManager, "input_given")

		if ((flags & CHAIN_BREAK ) >> 1 ) & (flags & ONE_SHOT):
			print("CBOS ", flags)
			events.remove(i)
			i -= 1
			break
		if flags & CHAIN_BREAK:
			print("CB")
			break
		if flags & ONE_SHOT:
			print("OS")
			events.remove(i)
			i -= 1
		i += 1
