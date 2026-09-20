class_name DogSystem extends Node2D

signal dog_fed_done()

@onready var bowl: SelectableArea = %Bowl
@onready var bag: SelectableArea = %Bag



enum States {
	EMPTY = 0,
	FULL = 1
}

var state: States = States.EMPTY


func _ready() -> void:
	set_state(States.EMPTY)


func next_state() -> void:
	if state != States.FULL:
		set_state(state + 1)


func set_state(new_state: States) -> void: 
	state = new_state
	
	
	if state == States.EMPTY:
		pass
		
		
	bowl.input_pickable = (state == States.EMPTY)
	bag.input_pickable = (state == States.EMPTY)
