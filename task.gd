class_name Task extends MarginContainer
## TODO: We will need a script that has a dictionary of all the tasks 

@onready var checkbox := %Checkbox
@onready var label := %Label

enum task_status {PENDING, DONE}

func _init(message: String) -> void:
	label.text = message
	checkbox.frame = task_status.PENDING


func complete_task() -> void:
	checkbox.frame = task_status.DONE
