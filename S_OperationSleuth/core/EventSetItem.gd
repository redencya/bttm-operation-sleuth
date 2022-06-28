extends Event
class_name EventSetItem

enum SetMode { ADD, REMOVE }
export (SetMode) var set_mode
export (Resource) var item_data

func exec():
	match set_mode:
		SetMode.ADD:
			print(item_data.name)
			CaptchaManager._captchalogue(item_data)
		SetMode.REMOVE:
			CaptchaManager._eject(item_data)
