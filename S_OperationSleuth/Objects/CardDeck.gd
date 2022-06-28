extends HBoxContainer

export (Resource) var sylladex

func _ready() -> void:
	sylladex.connect("changed", self, "_on_sylladex_changed")
	set_items_on_children(sylladex.items)

func clear_items_on_children() -> void:
	var children = get_children()
	for child in children:
		child.clear_item_texture()

func set_items_on_children(items: Array) -> void:
	var children = get_children()
	for i in items.size():
		children[i].item_string_name = items[i].name
		children[i].set_item_texture(items[i].texture)

func _on_sylladex_changed():
	print("yippee")
	clear_items_on_children()
	set_items_on_children(sylladex.items)
