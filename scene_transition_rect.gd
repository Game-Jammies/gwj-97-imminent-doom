class_name FadeTransition extends ColorRect

@onready var animation_player := %AnimationPlayer

func _ready() -> void: 
	# Plays the animation backward to fade in
	animation_player.play_backwards("Fade")

func fade_in() -> void:
	# Play the animation then wait until it finishes
	animation_player.play("Fade")
	await animation_player.animation_finished


func fade_out() -> void:
	animation_player.play_backwards("Fade")
	await animation_player.animation_finished
