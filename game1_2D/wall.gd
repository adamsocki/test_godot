extends Node2D



@export var door = false
@export var locked = false


#var root

# Player Settings
var player
var in_range


var text_box
var root_node


# Called when the node enters the scene tree for the first time.
func _ready():
	#root = get_tree().current_scene
	
	text_box = get_node("/root/GameManager/UIManager/Camera_UI/ActionText")

	
	
	text_box.visible = false
	in_range = false
#	player = get_node("../../")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if in_range:
		pass 


func _on_area_2d_body_entered(body):
	if door:
		text_box.text = "Press SPACE to Open Door"	
		
		text_box.visible = true
		in_range = true
		
		

func _on_area_2d_body_exited(body):
	if door:
		text_box.visible = false
		in_range = false
		


