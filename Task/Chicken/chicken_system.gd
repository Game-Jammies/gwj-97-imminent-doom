class_name ChickenSystem extends Node2D

signal chicken_done()
signal chicken_next_step()

@onready var fridge := %Fridge
@onready var chicken := %Chicken

enum States {
	IN_FRIDGE = 0,
	OUT_OF_FRIDGE = 1,
	DONE = 2
}

var state = States.IN_FRIDGE
@export var chicken_offset: Vector2

func _ready() -> void:
	set_state(States.IN_FRIDGE)


func next_state() -> void:
	if state != States.DONE:
		set_state(state + 1)
		chicken_next_step.emit()


func set_state(new_state: States) -> void: 
	state = new_state
	if state == States.IN_FRIDGE:
		fridge._sprite.frame = 0
		chicken._sprite.visible = false
	elif state == States.OUT_OF_FRIDGE:
		chicken._sprite.visible = true
		fridge._sprite.frame = 1
		chicken._sprite.frame = 0
	elif state == States.DONE:
		chicken._sprite.frame = 1
		fridge._sprite.frame = 0
		chicken.position += chicken_offset
		chicken_done.emit()
	
	fridge.input_pickable = (state == States.IN_FRIDGE)
	chicken.input_pickable = (state == States.OUT_OF_FRIDGE)
