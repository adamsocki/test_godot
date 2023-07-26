extends Node





func init_player():
	pass

func update_player_manager(delta):
	$Player.update_player(delta)
	
	# player switcher
	if Input.is_action_pressed("player_switch"):
		pass



