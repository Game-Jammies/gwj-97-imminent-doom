class_name TaskInfo extends MarginContainer

@onready var checkbox := %Checkbox
@onready var label := %Label

@export var message: String = "Default"
enum task_status {
	PENDING = 0, 
	DONE = 1,
}

func _ready() -> void:
	label.text = message
	checkbox.frame = task_status.PENDING

func update_message(new_message: String) -> void:
	label.text = new_message

func complete_task() -> void:
	checkbox.frame = task_status.DONE
