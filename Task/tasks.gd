class_name Tasks extends MarginContainer

var timePassed = 0

func _process(delta: float) -> void:
	timePassed += 1000 * delta
	if timePassed > 1000:
		%Task.show()
	if timePassed > 2000:
		%Task2.show()
	if timePassed > 3000:
		%Task3.show()
		
	


func _on_room_note_found(message: String) -> void:
	print("tasks")
	match message:
		"Chicken": %Chicken.show()
		"Trash": %Trash.show()
		"FeedDog": %DogFood.show()
		"WashDishes": %Dishes.show()

var dishTracker = 0
var trashTracker = 0
var chickenTracker = 0

func _on_dishes_next_step() -> void:
	match dishTracker:
		0: %Dishes.update_message("Wash The Dishes")
		1: %Dishes.update_message("Rinse The Dishes")
		2: %Dishes.update_message("Stack The Dishes")
		3: %Dishes.complete_task()
		
	dishTracker += 1
	
