extends Node2D

@onready var timer_label := %TimerLabel
@onready var timer := %Timer
@onready var go_to_kitchen_button := %GoToKitchen
@onready var go_to_bedroom_button := %GoToBedroom
@onready var bedroom := %Bedroom
@onready var kitchen := %KitchenRoom
@onready var bedtime_popup: PopupPanel = %BedtimePopup
@onready var opening_cut:= %OpeningCut
@onready var win_cut:= %WinCut
@onready var lose_cut:= %LoseCut
@onready var try_again_button := %TryAgainButton


## A list containing all the selectable objects
var selectable_areas: Array[SelectableArea] = []

## Dictionary with all of the task names, and whether they have been completed
var tasks: Dictionary[String, bool] = {
	"Trash" : false, # Take out the trash
	"Chicken" : false, # Take the chicken out the fridge and put it in the sink
	"FeedDog" : false, # Feed the dog
	"WashDishes": false, # Wash the dishes
	"DoHomework": false, # Do the homework
	"Lamp": false, # Turn off the bedroom lamp
	"Laundry": false, # Do the laundry
	"CleanCards": false, # Put the cards away
	"CleanToys": false, # Put the toys away
}




func finish_trash(): tasks["Trash"] = true
func finish_chicken(): tasks["Chicken"] = true
func finish_feed_dog(): tasks["FeedDog"] = true
func finish_dishes(): tasks["WashDishes"] = true
func finish_homework(): tasks["DoHomework"] = true
func finish_laundry(): tasks["Laundry"] = true
func finish_cards(): tasks["CleanCards"] = true
func finish_toys(): tasks["CleanToys"] = true

## The lamp is a special case where the task can be undone if the light is toggled back on
func lamp_off(): tasks["Lamp"] = true
func lamp_on(): tasks["Lamp"] = false

func _ready() -> void:
	# On a retry we skip straight past the intro cutscene
	if Global.skip_intro:
		opening_cut.visible = false
		_start_game()
	else:
		opening_cut.play()


func _on_video_stream_player_finished():
	opening_cut.visible = false
	_start_game()


func _start_game() -> void:
	kitchen.visible = false
	go_to_bedroom_button.visible = false
	bedroom.visible = true
	go_to_kitchen_button.visible = true
	timer_label.text = str(timer.time_left)
	_register_selectable_areas()
	timer.start()


func _process(_delta: float) -> void:
	var t = int(timer.time_left)
	timer_label.text = "%d:%02d" % [int(t / 60.0), t % 60]


func _show_bedtime_popup() -> void:
	bedtime_popup.popup_centered()


func _register_selectable_areas() -> void:
	var register_recursive = func(node: Node, rec):
		for child in node.get_children():
			if is_instance_of(child, SelectableArea):
				selectable_areas.append(child)
			else:
				rec.call(child, rec)
	# this is a functional programming trick that lets you call a lambda recursively
	register_recursive.call(self, register_recursive)


# The player goes to bed
func _on_player_sleeps() -> void:
	var win = true
	for task in tasks:
		if not tasks[task]: # if task not complete
			win = false
			break
	if win:
		win_cut.play()
	else:
		lose_cut.play()


func _on_timer_timeout() -> void:
	lose_cut.play()
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

# Cutscene finished
func _on_cut_finished() -> void:
	try_again_button.show()

# Reset the game
func _on_try_again_button_pressed() -> void:
	Global.skip_intro = false
	get_tree().paused = false
	get_tree().reload_current_scene()
