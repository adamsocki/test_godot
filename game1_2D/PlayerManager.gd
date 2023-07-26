extends Node


var player_node

var player_characters = []


func init_player_manager():
	player_node = get_node("/root/GameManager/EntityManager/Player")
	spawn_player()
	player_characters.append($Player)

func update_player_manager(delta):
	$Player.update_player(delta)
	
	# player switcher
	if Input.is_action_pressed("player_switch"):
		pass



func spawn_player():
	#self.add_child(player_node)
	var player_scene = load("res://player.tscn")
	var new_player_node = player_scene.instantiate()
	
	self.add_child(new_player_node)
	player_characters.append(new_player_node)
	
	#self.get_node("GameEntities").add_child(player_scene)
	
	
	
	
func switch_player():
	pass
