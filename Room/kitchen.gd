extends Node2D

signal dishes_done()
signal note_found(message: String)

func emit_dishes_done():
	dishes_done.emit()


func _on_note_note_found(message: String) -> void:
	note_found.emit(message)
	print("Kitchen")


func _on_dishes_note_note_found(message: String) -> void:
	note_found.emit(message)
	print("Kitchen")
