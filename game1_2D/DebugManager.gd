extends Node


@export var show_debug = false


func init_debug_manager():
	$Camera_UI.init_camera_ui()
	if show_debug:
		self.visible = true
	else:
		self.visible = false


func update_debug_manager(delta):
	if show_debug:
		$Camera_UI.update_camera_ui(delta)
