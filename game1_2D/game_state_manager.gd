extends Node

var transitioning

func init_game():
	get_node("../UIManager").init_start_menu()









func update_game_state_manager(game_state, delta):
	match game_state:
		Constants.GameState.StartGame:
			#print("test")
			get_node("../UIManager").show_start_menu()
			get_node("../UIManager").update_ui_start(delta)
		_:
			pass
			#print("not")
			
			

