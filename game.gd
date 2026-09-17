extends Node2D

@onready var timer_label := %TimerLabel
@onready var timer := %Timer

func _ready() -> void:
	timer_label.text = str(timer.time_left)
	timer.start()
	pass
	

func _process(delta: float) -> void:
	var t = int(timer.time_left)
	timer_label.text = "%d:%02d" % [t / 60, t % 60]


func _on_start_button_pressed() -> void:
	Global.goto_scene("res://bedroom.tscn")


func _on_timer_timeout() -> void:
	print("Time ran out! You're grounded!")
	pass 
