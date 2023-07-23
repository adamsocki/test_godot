extends Node


@export var camera_offset = Vector2(0, -350)
var player

func init_camera_manager():
	player = get_node("/root/GameManager/PlayerManager/Player")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_camera_manager(delta):
	$Camera.position = player.position
	$Camera.position += camera_offset
