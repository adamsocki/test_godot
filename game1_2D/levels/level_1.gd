extends Node2D


var functions = Functions.new()

func init_level():
	pass





func _process(delta):
	
	if $Player.velocity.x > 0.0:
		$Paralax_set_1.position.x += functions.paralax_mover(1) * delta
	elif $Player.velocity.x < 0.0:
		$Paralax_set_1.position.x -= functions.paralax_mover(1) * delta
		
	
