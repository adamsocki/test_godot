extends "res://Entity.gd"



@export var door = false
@export var locked = false


#var root

# Player Settings
var player
var in_range


var text_box
var root_node
var body_node
var try_to_open
@export var space_to_trigger = true

# Called when the node enters the scene tree for the first time.
func _ready():
	#root = get_tree().current_scene
	
	text_box = get_node("/root/GameManager/UIManager/Camera_UI/ActionText")

	
	
	text_box.visible = false
	in_range = false
	try_to_open = false
#	player = get_node("../../")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if door:
		text_box.text = "Press SPACE to Open Door"	
		text_box.visible = true
		in_range = true
		body_node = body
		body_node.current_over_entity = self
		
		

func _on_area_2d_body_exited(body):
	if door:
		text_box.visible = false
		in_range = false
		body_node = body
		body_node.current_over_entity = null
		body_node = null
		
		

func trigger_entity_by_player():
	print("hi")
	if in_range:
		var list = body_node.get_node("InventoryManager").current_inventory
		for item in list:
			print(item) 
			print(self)
