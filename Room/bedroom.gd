extends Node2D

signal request_bedtime()

@onready var bed: Bed = %Bed

func _ready() -> void:
	bed.request_bedtime.connect(func(): request_bedtime.emit())
