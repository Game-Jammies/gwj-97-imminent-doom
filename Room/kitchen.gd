extends Node2D

signal dishes_done()
signal trash_done()
signal chicken_done()

func emit_dishes_done():
	dishes_done.emit()


func emit_trash_done() -> void:
	trash_done.emit()


func emit_chicken_done() -> void:
	chicken_done.emit()
