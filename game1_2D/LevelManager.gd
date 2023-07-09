extends Node

var levels = [
	preload("res://levels/level_1.tscn")
		
	# Add more levels as needed...
]

var current_level_index
var current_level

func init_level_manager():
	current_level_index = -1
	current_level = null

func start_level(level_index):
	# Unload the current level if there is one
#	for i in range(levels.size()):
#		if levels[i] is PackedScene:
#			print("levels[" + str(i) + "] is a PackedScene.")
#		else:
#			print("levels[" + str(i) + "] is not a PackedScene.")
	if current_level != null:
		current_level.queue_free()
	print(levels[level_index])  # Should not be "[null instance]"

	print(level_index)
	
	# Load the new level
	current_level = levels[level_index].instantiate()

	# Add the new level as a child of this node
	add_child(current_level)

	# Store the new level index
	current_level_index = level_index

	print("Started level " + str(level_index + 1) + ".")

func next_level():
	# If there's a next level, start it
	if current_level_index < levels.size() - 1:
		print(current_level_index)
		
		start_level(current_level_index + 1)
	else:
		print("No more levels!")
