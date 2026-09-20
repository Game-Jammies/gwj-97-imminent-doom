extends Node2D

signal request_bedtime()
signal note_found(message: String)
signal homework_next_step()
signal homework_done()

@onready var bed: SelectableArea = %Bed

# bubbles up the bed's signal when it is clicked
func _ready() -> void:
	bed.area_clicked.connect(func(): request_bedtime.emit())


func _on_note_found(message: String) -> void:
	note_found.emit(message)


func _on_homework_system_next_step() -> void:
	homework_next_step.emit()


func _on_homework_done() -> void:
	homework_done.emit()
