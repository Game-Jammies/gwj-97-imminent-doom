class_name Tasks extends VBoxContainer

var timePassed = 0
var note = ""

func _process(delta: float) -> void:
	timePassed += 1000 * delta
	if timePassed > 1000:
		$Task.show()
	if timePassed > 2000:
		$Task2.show()
	if timePassed > 3000:
		$Task3.show()
		
	match note:
		"Chicken": $Task4.show()
		"Trash": $Task5.show()
		"FeedDog": $Task6.show()
		"WashDishes": $Task7.show()
