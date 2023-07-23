extends Node2D

var is_active = true

var entity_id: int
var entity_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func deactivate():
	is_active = false
	hide()

func activate():
	is_active = true
	show()