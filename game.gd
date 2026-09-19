extends Node2D

@onready var timer_label := %TimerLabel
@onready var timer := %Timer
@onready var go_to_kitchen_button := %GoToKitchen
@onready var go_to_bedroom_button := %GoToBedroom
@onready var bedroom := %Bedroom
@onready var kitchen := %KitchenRoom
@onready var bedtime_popup: PopupPanel = %BedtimePopup

## Dictionary with all of the task names, and whether they have been completed
var tasks: Dictionary[String, bool] = {
	"Trash" : false, # Take out the trash
	"Chicken" : false, # Take the chicken out the fridge and put it in the sink
	"FeedDog" : false, # Feed the dog
	"WashDishes": false, # Wash the dishes
	"TurnOffLight": false, # Turn off the bedroom lamp
}


func _ready() -> void:
	kitchen.visible = false
	go_to_bedroom_button.visible = false
	bedroom.visible = true
	go_to_kitchen_button.visible = true
	timer_label.text = str(timer.time_left)
	timer.start()
	pass
	

func _process(_delta: float) -> void:
	var t = int(timer.time_left)
	timer_label.text = "%d:%02d" % [int(t / 60.0), t % 60]


func _show_bedtime_popup() -> void:
	bedtime_popup.popup_centered()


# The player goes to bed
func _on_player_sleeps() -> void:
	var win = true
	for task in tasks:
		if not tasks[task]: # if task not complete
			win = false
			break
	if win:
		print("You survived!")
	else:
		print("You forgot something! You're grounded!")


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
