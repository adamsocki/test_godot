extends Node

var game_state
var functions

func _ready():
	
	game_state = Constants.GameState.StartGame
#	functions = Functions.new()
	$DebugManager.init_debug_manager()
	$CameraManager.init_camera_manager()
	$UIManager.init_ui_manager()
	$GameStateManager.init_game()
	$LevelManager.init_level_manager()
	$PlayerManager.init_player_manager()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$PlayerManager.update_player_manager(delta)
	$CameraManager.update_camera_manager(delta)
	$LevelManager.update_current_level(delta)
	$UIManager.update_ui_manager(delta)
	$GameStateManager.update_game_state_manager(game_state, delta)
	$DebugManager.update_debug_manager(delta)
	
	# Update based on current game_state
	match game_state:
		Constants.GameState.StartGame:
			pass
		Constants.GameState.InGame:
			$UIManager.update_ui_manager()
