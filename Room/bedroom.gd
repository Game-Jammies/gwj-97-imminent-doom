extends Node2D

signal request_bedtime()
signal note_found(message: String)

@onready var bed: SelectableArea = %Bed

# bubbles up the bed's signal when it is clicked
func _ready() -> void:
	bed.area_clicked.connect(func(): request_bedtime.emit())


func _on_note_found(message: String) -> void:
	note_found.emit(message)
	print("Bedroom")
