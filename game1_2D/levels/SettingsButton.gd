extends Button



var show_settings_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	
	show_settings_menu = false
	get_child(0).set_visible(show_settings_menu)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_settings_pressed():
	
	show_settings_menu = !show_settings_menu
	get_child(0).set_visible(show_settings_menu)	

	pass # Replace with function body.
