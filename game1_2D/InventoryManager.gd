extends Node



var current_inventory = []
var can_pickup_entity

func _ready():
	can_pickup_entity = false
	




func add_to_inventory(entity):
	current_inventory.append(entity)
#	entity.queue_free()  # Remove the entity from the scene
