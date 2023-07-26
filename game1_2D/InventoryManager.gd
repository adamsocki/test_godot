extends Node2D



var current_inventory = []
var can_pickup_entity



func _ready():
	can_pickup_entity = false


func add_to_inventory(entity):
	current_inventory.append(entity)
	var entity_parent = entity.get_parent()
	entity_parent.remove_child(entity)
	self.add_child(entity)
