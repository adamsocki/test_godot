# InventoryManager.gd

extends Node2D

var ui_inventory

var current_inventory = []
var can_pickup_entity


func _ready():
	ui_inventory = get_node("/root/GameManager/UIManager/Camera_UI/InventoryList")
	can_pickup_entity = false


func add_to_inventory(entity):
	current_inventory.append(entity)
	var entity_parent = entity.get_parent()
	entity_parent.remove_child(entity)
	self.add_child(entity)
	ui_inventory.add_item(entity.entity_name, null, true)
