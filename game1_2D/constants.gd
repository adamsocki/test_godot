extends Node

class_name Constants

enum GameState 
{	
	StartGame,
	MainMenu,
	Playing,
	Paused,
	GameOver,
	
	InGame,
	LevelPlay
}



enum TransitionType
{
	from_start,
	from_level
}

enum MenuType
{
	settings_menu
}

enum PlayerState
{
	idle,
	walking
}
