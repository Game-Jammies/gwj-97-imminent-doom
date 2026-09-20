class_name DogSystem extends Node2D

signal dog_fed_done()
signal dog_next_step()

@onready var bowl: SelectableArea = %Bowl
@onready var bag: Bag = %Bag

enum States {
	EMPTY = 0,
	FULL = 1
}

var state: States = States.EMPTY
@onready var bag_init_pos: Vector2 = bag.position

func _ready() -> void:
	set_state(States.EMPTY)

func _process(_delta) -> void:
	if state != States.EMPTY:
		return
	
	if bag._is_dragging:
		bag.global_transform.origin = get_global_mouse_position()
	
	# Dog food bag area scans layer 3.
	if bag.has_overlapping_areas():
		bag._sprite.frame = 1
		if !bag._is_dragging: # Player releases the bag while hovering the bowl
			next_state()
	else:
		bag._sprite.frame = 0

func next_state() -> void:
	if state != States.FULL:
		set_state(state + 1)


func set_state(new_state: States) -> void: 
	state = new_state
	
	if state == States.FULL:
		bag._sprite.frame = 0
		bag.position = bag_init_pos
		bowl._sprite.frame = 2
		dog_fed_done.emit()
		
	bowl.input_pickable = (state == States.EMPTY)
	bag.input_pickable = (state == States.EMPTY)
