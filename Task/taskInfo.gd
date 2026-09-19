class_name TaskInfo extends MarginContainer

@onready var checkbox := %Checkbox
@onready var label := %Label

enum task_status {PENDING, DONE}

@export var message: String = "Task info"

var status := task_status.PENDING


func _ready() -> void:
	label.text = message
	checkbox.frame = status


func set_message(new_message: String) -> void:
	message = new_message
	if is_node_ready():
		label.text = message


func complete_task() -> void:
	status = task_status.DONE
	if is_node_ready():
		checkbox.frame = status
