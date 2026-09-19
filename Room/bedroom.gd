extends Node2D

signal request_bedtime()

@onready var bed: SelectableArea = %Bed

# bubbles up the bed's signal when it is clicked
func _ready() -> void:
	bed.area_clicked.connect(func(): request_bedtime.emit())
