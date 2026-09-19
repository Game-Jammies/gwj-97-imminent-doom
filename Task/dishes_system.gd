class_name DishesSystem extends Node2D

signal dishes_done()

@onready var dishes: SelectableArea = %Dishes
@onready var faucet: SelectableArea = %Faucet

@export var dishes_offset: Vector2

enum DishesState {
	DIRTY_DRY = 0,
	DIRTY_WET = 1,
	CLEAN_WET = 2,
	CLEAN_DRY = 3,
	STACKED = 4,
}

var state: DishesState = DishesState.DIRTY_DRY


func _ready() -> void:
	set_state(DishesState.DIRTY_DRY)


func next_state() -> void:
	if state != DishesState.STACKED:
		set_state(state + 1)


func set_state(new_state: DishesState) -> void: 
	state = new_state
	dishes._sprite.frame = state
	
	if state == DishesState.STACKED:
		dishes.position += dishes_offset
		dishes_done.emit()
		
	dishes.input_pickable = (state == DishesState.DIRTY_WET || state == DishesState.CLEAN_DRY)
	faucet.input_pickable = (state == DishesState.DIRTY_DRY || state == DishesState.CLEAN_WET)
