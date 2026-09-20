class_name Tasks extends MarginContainer

func _on_room_note_found(message: String) -> void:
	print("tasks")
	match message:
		"Chicken": %Chicken.show()
		"Trash": %Trash.show()
		"FeedDog": %DogFood.show()
		"WashDishes": %Dishes.show()
		"DoHomework" : %Homework.show()
		

var dishTracker = 0
var trashTracker = 0
var chickenTracker = 0
var homeworkTracker = 0

func _on_dishes_next_step() -> void:
	match dishTracker:
		0: %Dishes.update_message("Wash The Dishes")
		1: %Dishes.update_message("Rinse The Dishes")
		2: %Dishes.update_message("Stack The Dishes")
		3: %Dishes.complete_task()
		
	dishTracker += 1
		
func _on_trash_next_step() -> void:
	match trashTracker:
		0: %Trash.update_message("Remove Trash Bag")
		1: %Trash.update_message("Take Trash Out Door")
		2: %Trash.complete_task()
		
	trashTracker += 1
	
func _on_homework_next_step() -> void:
	match homeworkTracker:
		0: %Homework.update_message("Do Homework")
		1: %Homework.complete_task()
		
	homeworkTracker += 1


func _on_dog_food_done() -> void:
	%DogFood.complete_task()


func _on_chicken_next_step() -> void:
	match chickenTracker:
		0: %Chicken.update_message("Put Chicken In Sink")
		1: %Chicken.complete_task()
	
	chickenTracker += 1
		
