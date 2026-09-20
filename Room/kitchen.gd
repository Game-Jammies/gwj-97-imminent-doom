extends Node2D

signal dishes_done()
signal note_found(message: String)
signal dish_next_step()
signal trash_next_step()
signal trash_done()
signal chicken_done()

func emit_dishes_done():
	dishes_done.emit()


func _on_note_note_found(message: String) -> void:
	note_found.emit(message)


func _on_dishes_system_next_step() -> void:
	dish_next_step.emit()


func _on_trash_next_step() -> void:
	trash_next_step.emit()


func emit_trash_done() -> void:
	trash_done.emit()


func emit_chicken_done() -> void:
	chicken_done.emit()


func _on_dog_system_dog_fed_done() -> void:
	pass # Replace with function body.
