extends Node


var game_state


# Called when the node enters the scene tree for the first time.
func _ready():
	game_state = Constants.GameState.StartGame
	$GameStateManager.init_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$GameStateManager.update_game_state_manager(game_state, delta)
	
