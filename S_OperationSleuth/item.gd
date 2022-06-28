extends Resource
class_name Item

enum HoverMode { EXAMINE, CAPTCHALOGUE, ENTER }
export (String) var name_if_not_label

export (HoverMode) var hovered
# when in a vessel
export (Array, Resource) var clicked
# when in a sylladex
export (Array, Resource) var merged
# when used from a sylladex on a vessel
export (Array, Resource) var given
