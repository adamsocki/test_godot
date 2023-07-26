# Key.gd
extends "res://Entity.gd"


var UI_Manager

var pickup_label

@export var key_code: String


func _ready():
	pickup_label = Label.new()
	pickup_label.text = "Press X to pick up Key"
	pickup_label.position = Vector2(400, 400)
	pickup_label.visible = false
	UI_Manager = get_node("/root/GameManager/UIManager/Camera_UI")
	UI_Manager.add_child(pickup_label)
	
	
	entity_manager = get_node("/root/GameManager/EntityManager")
	entity_manager.add_entity(Constants.EntityType.KEY, self)

func _on_interact_player_body_entered(body):
	pickup_label.visible = true
	body.get_node("InventoryManager").can_pickup_entity = true
	body.current_over_entity = self


func _on_interact_player_body_exited(body):
	pickup_label.visible = false
	body.get_node("InventoryManager").can_pickup_entity = false
