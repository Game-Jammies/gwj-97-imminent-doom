class_name TaskInfo extends MarginContainer
## TODO: We will need a script that has a dictionary of all the tasks 

@onready var checkbox := %Checkbox
@onready var label := %Label
var start_message: String = "uninitialized"

enum task_status {
	PENDING = 0, 
	DONE = 1,
}

func _init(message: String = "default message") -> void:
	start_message = message

func _ready() -> void:
	label.text = start_message
	checkbox.frame = task_status.PENDING

func update_message(new_message: String) -> void:
	label.text = new_message

func complete_task() -> void:
	checkbox.frame = task_status.DONE
