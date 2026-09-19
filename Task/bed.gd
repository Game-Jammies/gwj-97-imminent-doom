extends SelectableArea

# Just tells the on_click function not to do the default behavior.
# Can be remmoved if we get rid of SelectableArea's default on_click implementation.
func _on_click() -> void: pass
