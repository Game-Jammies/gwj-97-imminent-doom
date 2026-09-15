extends Node

@onready var transition_rect := %SceneTransitionRect
var is_transitioning: bool = false
@export var room_container: Node

func goto_scene(path: String):
	# Prevent inputs when transitioning
	if is_transitioning:
		return
	is_transitioning = true
	get_tree().paused = true
	await transition_rect.fade_in()
	_swap_scene(path)
	await transition_rect.fade_out()
	get_tree().paused = false
	is_transitioning = false


func _swap_scene(path: String):
	# It is now safe to remove the current scene.
	var current_scene = get_tree().current_scene
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)
	
	get_tree().current_scene = current_scene
