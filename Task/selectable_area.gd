class_name SelectableArea extends Area2D

signal area_clicked()

@onready var _sprite = $Sprite2D
var is_in_menu: bool = false
var _is_hovering: bool = false
var _is_dragging: bool = false
var _base_modulate: Color = Color.WHITE

func _ready() -> void:
	_base_modulate = _sprite.modulate
	mouse_entered.connect(_hover_start)
	mouse_exited.connect(_hover_end)
	input_event.connect(_on_input_event)

func _process(_delta) -> void:
	if input_pickable and _is_hovering and not is_in_menu:
		_sprite.modulate = _base_modulate * Color(1.05, 1.15, 1.15, 1.0)
	else: 
		_sprite.modulate = _base_modulate

func _hover_start(): _is_hovering = true
func _hover_end(): _is_hovering = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_on_click()
			area_clicked.emit()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
		_is_dragging = false

func _on_click() -> void: 
	# Temporary default behavior. Might not be included in our final implementation.
	#var total_frames = _sprite.hframes * _sprite.vframes
	#if _sprite.frame + 1 >= total_frames:
		#_sprite.frame = 0
	#else:
		#_sprite.frame += 1
	pass
