class_name ToysSystem extends Node2D

signal toys_done()

@onready var blue_toy := %BlueToy
@onready var purple_toy := %PurpleToy
@onready var blue_shelf := %BlueShelf
@onready var purple_shelf := %PurpleShelf

enum States {
	GROUND = 0,
	BLUE = 1,
	PURPLE = 2,
	SHELVED = 3
}

var state = States.GROUND

func _ready() -> void:
	set_state(States.GROUND)

func _process(_delta) -> void:
	if state == States.SHELVED:
		return
	
	if blue_toy._is_dragging:
		blue_toy.global_transform.origin = get_global_mouse_position()
	elif purple_toy._is_dragging:
		purple_toy.global_transform.origin = get_global_mouse_position()
	
	# Blue area scans layer 5.
	if blue_toy.has_overlapping_areas():
		blue_toy._sprite.frame = 1
		if !blue_toy._is_dragging: 
			if state == States.PURPLE:
				set_state(States.SHELVED)
			else:
				set_state(States.BLUE)
	# Purple area scans layer 6.
	if purple_toy.has_overlapping_areas():
		purple_toy._sprite.frame = 1
		if !purple_toy._is_dragging: 
			if state == States.BLUE:
				set_state(States.SHELVED)
			else:
				set_state(States.PURPLE)



func set_state(new_state: States) -> void: 
	state = new_state
	
	if state == States.GROUND:
		pass
	elif state == States.BLUE:
		blue_toy.position = blue_shelf.position
		blue_shelf.hide()
	elif state == States.PURPLE:
		purple_toy.position = purple_shelf.position
		purple_shelf.hide()
		
	else:
		if blue_shelf.visible:
			blue_toy.position = blue_shelf.position
			blue_shelf.hide()
		elif purple_shelf.visible:
			purple_toy.position = purple_shelf.position
			purple_shelf.hide()
		toys_done.emit()
	blue_toy.input_pickable = (state == States.GROUND || state == States.PURPLE)
	purple_toy.input_pickable = (state == States.GROUND || state == States.BLUE)
	blue_shelf.input_pickable = (state == States.GROUND || state == States.PURPLE)
	purple_shelf.input_pickable = (state == States.GROUND || state == States.BLUE)
