extends Action
class_name ActionDisplayText

enum TextMode { START, CONTINUE, END }
export (TextMode) var text_mode

export (String, MULTILINE) var contents
