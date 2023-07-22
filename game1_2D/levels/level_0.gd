extends Node2D



var level_manager
var player


func init_level():
	player = get_node("../../PlayerManager/Player")
	level_manager = get_parent()
	player.visible = false
	player.position = $PlayerStart.position


func update_level(delta):
	pass


func _on_start_game_button_pressed():
	level_manager.next_level()



