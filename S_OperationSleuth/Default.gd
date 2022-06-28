extends State

func _clicked(item: Item = null):
	state_machine.set_state("Changed")

func _exit():
	print("Default state is exiting")
