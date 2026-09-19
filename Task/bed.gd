class_name Bed extends SelectableArea

signal request_bedtime()

func _on_click() -> void: 
	request_bedtime.emit()
