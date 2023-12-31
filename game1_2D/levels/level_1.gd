extends Node2D

var player


var functions = Functions.new()

func init_level():
	player = get_node("/root/GameManager/PlayerManager/Player")
	player.visible = true
	player.position = $Start.global_position
	#$Player_False.queue_free()
	player.gravity = 4000



func update_level(delta):
	if player.velocity.x > 0.0 && player.to_move:
		$Paralax_set_1.position.x += functions.paralax_mover(1) * delta
		$Paralax_set_2.position.x += functions.paralax_mover(2) * delta
		
	elif player.velocity.x < 0.0 && player.to_move:
		$Paralax_set_1.position.x -= functions.paralax_mover(1) * delta
		$Paralax_set_2.position.x -= functions.paralax_mover(2) * delta
