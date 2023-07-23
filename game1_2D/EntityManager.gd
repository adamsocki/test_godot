extends Node

var entities = {}

enum EntityType {TERRAIN, PLAYER, TEST, FERN, WALL, POST}

func _ready():
	# Initialize our entity storage
	for type in EntityType.values():
		entities[type] = []

func add_entity(type, entity):
	# Add the entity to the appropriate list
	entities[type].append(entity)
	# And add it as a child of this node
	add_child(entity)

func delete_entity(type, entity):
	# Remove the entity from the appropriate list
	entities[type].erase(entity)
	# And remove it as a child of this node
	entity.queue_free()




