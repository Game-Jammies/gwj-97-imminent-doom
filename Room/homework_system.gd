class_name HomeworkSystem extends Node2D

signal homework_done()
signal homework_next_step()

@onready var homework: SelectableArea = %Folder
@onready var pencil: SelectableArea = %Pencil

@export var homework_offset: Vector2

enum HomeworkState {
	CLOSED = 0,
	OPEN = 1,
	MARKED = 2,
}

var state: HomeworkState = HomeworkState.CLOSED


func _ready() -> void:
	set_state(HomeworkState.CLOSED)


func next_state() -> void:
	if state != HomeworkState.MARKED:
		set_state(state + 1)
		homework_next_step.emit()
		print("homeworknext")


func set_state(new_state: HomeworkState) -> void: 
	state = new_state
	homework._sprite.frame = state
	
	if state == HomeworkState.MARKED:
		homework.position += homework_offset
		homework_done.emit()
		
	pencil.input_pickable = (state == HomeworkState.OPEN)
	homework.input_pickable = (state == HomeworkState.CLOSED)
