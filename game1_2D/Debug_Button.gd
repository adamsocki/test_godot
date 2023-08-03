extends Button

@export var button_label : String
var player_debug

@export var button_type : Constants.ButtonType
#var set_name  =  true



# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._button_pressed)
	player_debug = get_node("/root/GameManager/PlayerManager/Player/Debug")
	$Label.text = button_label

func _process(delta):
	if button_pressed:
		match button_type:
			Constants.ButtonType.Entity_Name:
				entity_name_debug()
			Constants.ButtonType.Portal_Name:
				portal_name_debug()
			_:
				pass
		self.text = "X"

	else:
		self.text = " "


func _button_pressed():
	pass
#	set_name = !set_name


func entity_name_debug():
	if (player_debug.get_parent().current_over_entity != null):
		player_debug.get_child(0).set_text(player_debug.get_parent().current_over_entity.entity_name)
	else:
		player_debug.get_child(0).set_text("")

func portal_name_debug():
	if (player_debug.get_parent().portal_type != Constants.PortalType.BLANK):
		player_debug.get_child(0).set_text(Constants.PortalType.find_key(player_debug.get_parent().portal_type))
	else:
		player_debug.get_child(0).set_text("")
