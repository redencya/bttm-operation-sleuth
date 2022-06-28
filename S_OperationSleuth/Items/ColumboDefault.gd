extends State

export (NodePath) var subject
var columbo

func _clicked():
	Event.display_text("This is Columbo, blah blah, pick him up")
	columbo.change_name("Columbo cutout")
	Event.add_item(columbo)
	queue_free()

func _hovered():
	# Show name "cutout"
	pass

func _item_used(item: Item):
	match item.name:
		_:
			Event.display_text("You can't use this on Columbo, dumbass")
