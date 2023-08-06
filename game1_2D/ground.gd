extends StaticBody2D


var is_on_ground = false
@export var ground_type : Constants.GroundType


func _on_area_2d_body_entered(body):
	if ground_type == Constants.GroundType.STAIRS:
		is_on_ground = true
		body.on_stairs = true
		print("stairs")


func _on_area_2d_body_exited(body):
	if ground_type == Constants.GroundType.STAIRS:
		is_on_ground = false
		body.on_stairs = false
