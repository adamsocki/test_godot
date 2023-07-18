extends Node2D



var level_manager


func init_level():
	level_manager = get_parent()


func update_level():
	pass


func _on_start_game_button_pressed():
	level_manager.next_level()



