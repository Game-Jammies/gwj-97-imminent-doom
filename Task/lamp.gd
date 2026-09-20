class_name Lamp extends SelectableArea

signal lamp_on()
signal lamp_off()

@onready var canvas_modulate: CanvasModulate = %CanvasModulate

enum States {
	ON = 0,
	OFF = 1
}

var state = States.ON

func _on_click() -> void:
	# Toggle the light
	if state == States.ON:
		state = States.OFF
		canvas_modulate.color = Color(0.35,0.54,0.90,1.00) 
		_sprite.frame = 1
		lamp_off.emit()
	else:
		state = States.ON
		canvas_modulate.color = Color(1,1,1,1)
		_sprite.frame = 0
		lamp_on.emit()
