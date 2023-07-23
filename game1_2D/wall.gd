extends Node2D



@export var door = false
var root_node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if door:
		pass



func _on_area_2d_body_entered(body):
	root_node = get_node("../../../UIManager/Camera_UI/CheckBox")
	root_node.show()


func _on_area_2d_body_exited(body):
	root_node = get_node("../../../UIManager/Camera_UI/CheckBox")
	root_node.hide()
