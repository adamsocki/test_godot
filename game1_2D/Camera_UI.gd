extends Node2D

var camera

# Called when the node enters the scene tree for the first time.
func init_camera_ui():
	camera = get_node("../../CameraManager/Camera")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_camera_ui(delta):
	self.position = camera.position
	var transform = get_canvas_transform()
	self.position.x -= 640
	self.position.y -= 480
	
