extends Node

var game_state
var functions
# Called when the node enters the scene tree for the first time.
func _ready():
	
	game_state = Constants.GameState.StartGame
#	functions = Functions.new()
	$GameStateManager.init_game()
	$LevelManager.init_level_manager()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$GameStateManager.update_game_state_manager(game_state, delta)
	
	# Update based on current game_state
	match game_state:
		Constants.GameState.StartGame:
			pass
		Constants.GameState.InGame:
			$UIManager.update_ui_manager()
