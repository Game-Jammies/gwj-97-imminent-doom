extends Node2D

signal dishes_done()

func emit_dishes_done():
	dishes_done.emit()
