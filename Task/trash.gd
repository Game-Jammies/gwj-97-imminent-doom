class_name Trash extends SelectableArea

@onready var trash_bag := $TrashBag

enum States {
	CLOSED = 0, # Trash can is closed
	OPEN = 1, # Trash can is open and has bag inside
	EMPTY = 2, # Trash bag is removed from the can
	DONE = 3, # Trash bag is dragged into the back door
}

var current_state = States.CLOSED

func _ready() -> void:
	super()
	trash_bag.visible = false

## Overrides the SelectableArea _on_click() function
func _on_click() -> void:
	
	if current_state == States.CLOSED:
		current_state = States.OPEN
		_sprite.frame = 1
	elif current_state == States.OPEN:
		current_state = States.EMPTY
		_sprite.frame = 2
		trash_bag.visible = true
