extends Node2D

signal dishes_done()
signal trash_done()

func emit_dishes_done():
	dishes_done.emit()


func emit_trash_done() -> void:
	trash_done.emit()
