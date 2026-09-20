class_name CardSystem extends Node2D

signal cards_done()

@onready var cards := %Cards
@onready var deck_box := %DeckBox
@onready var shelf := %Shelf

enum States {
	ON_FLOOR = 0,
	IN_BOX = 1,
	ON_SHELF = 2
}

var state = States.ON_FLOOR

func _ready() -> void:
	set_state(States.ON_FLOOR)

func _process(_delta) -> void:
	if state != States.IN_BOX:
		return
	
	if deck_box._is_dragging:
		deck_box.global_transform.origin = get_global_mouse_position()
	
	# Deck box area scans layer 2.
	if deck_box.has_overlapping_areas():
		deck_box._sprite.frame = 1
		if !deck_box._is_dragging: # Player releases the bag while hovering the bowl
			next_state()

func next_state() -> void:
	if state != States.ON_SHELF:
		set_state(state + 1)


func set_state(new_state: States) -> void: 
	state = new_state
	
	if state == States.ON_FLOOR:
		pass
	elif state == States.IN_BOX:
		cards.hide()
		shelf.show()
	else:
		deck_box.position = shelf.position
		shelf.hide()
		cards_done.emit()
		
	cards.input_pickable = (state == States.ON_FLOOR)
	deck_box.input_pickable = (state == States.IN_BOX)
	shelf.input_pickable = (state == States.IN_BOX)
