extends Node

var transitioning

func init_game():
	pass
#	get_node("../UIManager").init_start_menu()


func update_game_state_manager(game_state, delta):
	match game_state:
		Constants.GameState.StartGame:
			#print("test")
			
#			get_node("../UIManager").show_start_menu()
#			get_node("../UIManager").update_ui_start(delta)
			pass
			
		Constants.GameState.InGame:
			pass
			#print("inGame")
#			get_node("../UIManager").update_ui_level(delta)
			#print("not")
			
			

