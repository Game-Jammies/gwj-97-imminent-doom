class_name Door extends Area2D

@onready var _sprite := %DoorSprite

func _on_trash_hovering_door() -> void:
	if _sprite.frame != 1:
		_sprite.frame = 1


func _on_trash_trash_done() -> void:
	_sprite.frame = 0
