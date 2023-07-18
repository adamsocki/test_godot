extends Node2D


@export var speed = 400
var player_moving = false

var player_state

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	player_state = Constants.PlayerState.idle
	
#	position = pos





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		player_state = Constants.PlayerState.walking
		player_moving = true
		
	else:
		player_state = Constants.PlayerState.idle
		player_moving = false
		
	
	position += velocity * delta
	
	
#	match player_state:
		
#		Constants.PlayerState.walking:
#			if !$WalkingAnimatedSprite2D.is_playing():
#				$IdleAnimatedSprite2D.stop()
#				$WalkingAnimatedSprite2D.play("idle", false, false)
#		Constants.PlayerState.idle:
#			if !$IdleAnimatedSprite2D.is_playing():
#				$WalkingAnimatedSprite2D.stop()
#				$IdleAnimatedSprite2D.play("idle", false, false)
