class_name LaundrySystem extends Node2D

signal laundry_done()

@onready var basket: SelectableArea = %Basket
@onready var closet: SelectableArea = %Closet
@onready var clothes: SelectableArea = %Clothes

@export var basket_offset: Vector2

enum LaundryState {
	PILE = 0,
	HANGER = 1,
	CLOSET = 2,
	STORED = 3,
}

var state: LaundryState = LaundryState.PILE


func _ready() -> void:
	set_state(LaundryState.PILE)


func next_state() -> void:
	if state != LaundryState.STORED:
		set_state(state + 1)
		print("laundrynext")


func set_state(new_state: LaundryState) -> void: 
	state = new_state
	basket._sprite.frame = state
	
	match state:
		LaundryState.HANGER:
			clothes.show()
		LaundryState.CLOSET:
			closet._sprite.frame = 1
		LaundryState.STORED:
			basket.position += basket_offset
			closet._sprite.frame = 0
			clothes.hide()
			laundry_done.emit()
		
	clothes.input_pickable = (state == LaundryState.CLOSET)
	basket.input_pickable = (state == LaundryState.PILE)
	closet.input_pickable = (state == LaundryState.HANGER)
