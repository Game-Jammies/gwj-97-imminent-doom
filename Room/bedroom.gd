extends Node2D

signal request_bedtime()
signal note_found(message: String)
signal homework_next_step()
signal homework_done()
signal lamp_off()
signal lamp_on()
signal cards_done()
signal toys_done()

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


func _on_lamp_off() -> void:
	lamp_off.emit()


func _on_lamp_on() -> void:
	lamp_on.emit()


func _on_cards_done() -> void:
	cards_done.emit()


func _on_toys_done() -> void:
	toys_done.emit()
