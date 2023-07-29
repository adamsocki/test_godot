# portal.gd
extends "res://Entity.gd"


@export var portal_type : Constants.PortalType

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interact_player_body_entered(body):
	body.portal_type = portal_type
	


func _on_interact_player_body_exited(body):
	body.portal_type = null
