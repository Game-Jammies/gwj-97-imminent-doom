class_name Note extends SelectableArea

signal note_found(message: String)
@export var sprite_frame: int = 0
@export var message: String = "Default"
@onready var sprite = $Sprite2D

func _on_click() -> void:
	hide()
	note_found.emit(message)

func _ready() -> void: 
	super()
	sprite.frame = sprite_frame
