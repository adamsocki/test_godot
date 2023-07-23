extends Node2D



@export var door = false
var text_box
var root_node
# Called when the node enters the scene tree for the first time.
func _ready():
	text_box = get_node("../../../UIManager/Camera_UI/ActionText")
	text_box.text = "Press SPACE to Open Door"	
	text_box.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if door:
		pass



func _on_area_2d_body_entered(body):
	text_box.visible = true


func _on_area_2d_body_exited(body):
	text_box.visible = false
