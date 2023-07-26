extends ItemList


@export var inventory_capacity : int

var player_inventory


func _ready():
	player_inventory = get_node("/root/GameManager/PlayerManager/Player/InventoryManager")
	

# Called when the node enters the scene tree for the first time.
func get_current_inventory():
	pass
