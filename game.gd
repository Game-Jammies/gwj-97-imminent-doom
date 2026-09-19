extends Node2D

@onready var timer_label := %TimerLabel
@onready var timer := %Timer
@onready var go_to_kitchen_button := %GoToKitchen
@onready var go_to_bedroom_button := %GoToBedroom
@onready var bedroom := %Bedroom
@onready var kitchen := %KitchenRoom


func _ready() -> void:
	kitchen.visible = false
	go_to_bedroom_button.visible = false
	bedroom.visible = true
	go_to_kitchen_button.visible = true
	timer_label.text = str(timer.time_left)
	timer.start()
	pass
	

func _process(delta: float) -> void:
	var t = int(timer.time_left)
	timer_label.text = "%d:%02d" % [t / 60, t % 60]


func _on_timer_timeout() -> void:
	print("Time ran out! You're grounded!")
	pass 


func _on_go_to_bedroom_pressed() -> void:
	Global.start_transition()
	go_to_bedroom_button.visible = false
	bedroom.visible = true
	kitchen.visible = false
	go_to_kitchen_button.visible = true
	Global.end_transition()
	


func _on_go_to_kitchen_pressed() -> void:
	Global.start_transition()
	go_to_kitchen_button.visible = false
	kitchen.visible = true
	bedroom.visible = false
	go_to_bedroom_button.visible = true
	Global.end_transition()
