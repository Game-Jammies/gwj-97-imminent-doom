class_name Note extends SelectableArea

signal note_found(message: String)

@export var message: String = "Default"

func _on_click() -> void:
	hide()
	note_found.emit(message)
	print("Note")
