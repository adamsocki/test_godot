extends Node

var levels 
var menus
 

var current_level_index
var current_level

func init_level_manager():
	levels = [
		preload("res://levels/level_0.tscn"),
		preload("res://levels/level_1.tscn")
	]
	
	
	
	current_level_index = 0
	current_level = null
	
	start_level(current_level_index)
	

func start_level(level_index):

	if current_level != null:
		current_level.queue_free()
		
	# Load the new level
	current_level = levels[level_index].instantiate()

	# Add the new level as a child of this node
	add_child(current_level)

	# Store the new level index
	current_level_index = level_index


func next_level():
	# If there's a next level, start it
	if current_level_index < levels.size() - 1:
		start_level(current_level_index + 1)
	else:
		print("No more levels!")


