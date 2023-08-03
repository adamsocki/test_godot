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

enum EntityType
{
	TERRAIN, PLAYER, TEST, FERN, WALL, POST, KEY, EntityType_Count
}

enum ButtonType
{
	Entity_Name,
	Portal_Name
}

enum PortalSide
{
	SIDE_A, SIDE_B, NONE
}

enum PortalType
{
	DOWN, SUBWAY_DOOR , BLANK
}
