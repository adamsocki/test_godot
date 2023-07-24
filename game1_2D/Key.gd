# Key.gd
extends "res://Entity.gd"


var UI_Manager

var pickup_label



var key_code: String



func _ready():
	pickup_label = Label.new()
	pickup_label.text = "Press X to pick up Key"
	pickup_label.position = Vector2(400, 400)
	pickup_label.visible = false
	UI_Manager = get_node("/root/GameManager/UIManager/Camera_UI")
	UI_Manager.add_child(pickup_label)
	

func _on_interact_player_body_entered(body):
	pickup_label.visible = true
	print(key_code)


func _on_interact_player_body_exited(body):
	pickup_label.visible = false
