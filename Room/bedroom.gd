extends Node2D

signal request_bedtime()
signal note_found(message: String)
signal homework_next_step()

@onready var bed: SelectableArea = %Bed
signal laundry_done()
signal homework_done()

# bubbles up the bed's signal when it is clicked
func _ready() -> void:
	bed.area_clicked.connect(func(): request_bedtime.emit())


func _on_note_found(message: String) -> void:
	note_found.emit(message)
	print("Bedroom")


func _on_homework_system_next_step() -> void:
	homework_next_step.emit()
	print("HomeworkNextBedroom")

func emit_laundry_done() -> void:
	laundry_done.emit()
	
func emit_homework_done() -> void:
	homework_done.emit()
