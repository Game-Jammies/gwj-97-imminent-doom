class_name TrashBag extends SelectableArea
signal trash_removed
signal hovering_door
@onready var trash_bag := %Sprite2D
@onready var bag_collision_polygon := %BagCollisionPolygon

func _ready() -> void:
	super()
	trash_bag.visible = false
	bag_collision_polygon.disabled = true

func _process(_delta) -> void:
	super(_delta)
	if _is_dragging:
		global_transform.origin = get_global_mouse_position()
	
	if has_overlapping_areas():
		# Trashbag area scans layer 4.
		hovering_door.emit()
		if !_is_dragging: # Player releases trash while hovering the door
			disable()
			trash_removed.emit()

func _on_click() -> void:
		_is_dragging = true

func enable() -> void:
	bag_collision_polygon.disabled = false
	trash_bag.visible = true

func disable() -> void:
	bag_collision_polygon.disabled = true
	trash_bag.visible = false
