class_name Trash extends SelectableArea
signal trash_done
signal hovering_door
@onready var trash_bag := $TrashBag
@onready var can_collision_polygon := $CanCollisionPolygon


enum States {
	CLOSED = 0, # Trash can is closed
	OPEN = 1, # Trash can is open and has bag inside
	EMPTY = 2, # Trash bag is removed from the can
	DONE = 3, # Trash bag is dragged into the back door
}

var current_state = States.CLOSED


## Overrides the SelectableArea _on_click() function
func _on_click() -> void:
	
	if current_state == States.CLOSED:
		current_state = States.OPEN
		_sprite.frame = 1
	elif current_state == States.OPEN:
		current_state = States.EMPTY
		_sprite.frame = 2
		can_collision_polygon.disabled = true
		trash_bag.enable()
		


func _on_trash_bag_trash_removed() -> void:
	current_state = States.DONE
	_sprite.frame = 3
	trash_done.emit()


func _on_trash_bag_hovering_door() -> void:
	hovering_door.emit()
