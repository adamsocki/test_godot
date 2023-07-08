extends Node


var quit_game_button
var start_game_button
var game_title


var transitioning_type_1
var fade_in
var transition_screen_type_1

func init_start_menu():
	quit_game_button = $HBoxContainer/QuitGameButton
	start_game_button = $HBoxContainer/StartGameButton
	game_title = $Title
	
	game_title.text = "this is the game title"
	quit_game_button.text = "Quit"
	start_game_button.text = "Start"
	$HBoxContainer.set("theme_override_constants/separation", 100)
	
#	start_game_button.pressed.connect(on_button_pressed)
	transitioning_type_1 = false
	fade_in = false
	transition_screen_type_1 = $TransitionScreen
	transition_screen_type_1.hide()


func on_button_pressed():
#	start_game_button.text = "FORORORO"
	transitioning_type_1 = true
	transition_screen_type_1.show()
	



func update_ui_start(delta):
	if transitioning_type_1:
		var new_alpha = transition_screen_type_1.color.a
		if fade_in:
			new_alpha -= delta * 0.1  # Decrease alpha for fade in
		else:
			new_alpha += delta * 0.1 # Increase alpha for fade out
		new_alpha = clamp(new_alpha, 0, 1)
		transition_screen_type_1.color = Color(0, 0, 0, new_alpha)


	


func show_start_menu():
	pass

func update():
	pass
