extends Node


var quit_game_button
var start_game_button
var game_title



var transition_state



var menus


var fade_in
var transition_screen_type_1

var level_manager

func init_ui_manager():
	$Camera_UI.init_camera_ui()


func update_ui_manager(delta):
	set_cursor_position()
	$Camera_UI.update_camera_ui(delta)
	

func init_all_levels():
	quit_game_button = $HBoxContainer/QuitGameButton
	start_game_button = $HBoxContainer/StartGameButton
	game_title = $Title
	
	game_title.text = "this is the game title"
	quit_game_button.text = "Quit"
	start_game_button.text = "Start"
	$HBoxContainer.set("theme_override_constants/separation", 100)
	
	level_manager = get_node("../LevelManager")
	
#	start_game_button.pressed.connect(on_button_pressed)
	
	fade_in = false
	transition_screen_type_1 = $TransitionScreen
	transition_screen_type_1.hide()
	
	menus = [
		preload("res://menus/game_settings.tscn")  # Constants.MenuType.settings_menu [0]
	]

func on_start_button_pressed():
	start_game_button.text = "FORORORO"
	transition_state = Constants.TransitionType.from_start
	fade_in = true
	transition_screen_type_1.show()
	get_parent().get_parent().game_state = Constants.GameState.InGame
	


func transition_ui_fade(delta):
	match transition_state:
		Constants.TransitionType.from_start:
			var new_alpha = transition_screen_type_1.color.a
			if fade_in:
				new_alpha += delta * 0.8  # Decrease alpha for fade in
			else:
				new_alpha -= delta * 0.8 # Increase alpha for fade out
			new_alpha = clamp(new_alpha, 0, 1)
			transition_screen_type_1.color = Color(0, 0, 0, new_alpha)
			if (fade_in):
				if (new_alpha >= 1):
					return true
			else:
				if (new_alpha <= 0):
					return true
		Constants.TransitionType.from_level:
			pass


func update_ui_start(delta):
	if transition_state == Constants.TransitionType.from_start:
		var transition_complete = transition_ui_fade(delta)
		if transition_complete:
#			get_parent().game_state = Constants.GameState.Playing
			level_manager.next_level()
			transition_ui_fade(delta)






func set_cursor_position():
	pass
	#$Cursor.position = get_viewport().get_mouse_position()


func update_ui_level(delta):
	pass

func show_start_menu():
	pass

func update():
	pass
