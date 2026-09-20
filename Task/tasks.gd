class_name Tasks extends MarginContainer

var timePassed = 0
var note = ""

func noteGet(i: String):
	note = i

func _process(delta: float) -> void:
	timePassed += 1000 * delta
	if timePassed > 1000:
		%Task.show()
	if timePassed > 2000:
		%Task2.show()
	if timePassed > 3000:
		%Task3.show()
		
	


func _on_kitchen_room_note_found(message: String) -> void:
	print("tasks")
	match message:
		"Chicken": %Chicken.show()
		"Trash": %Trash.show()
		"FeedDog": %DogFood.show()
		"WashDishes": %Dishes.show()
