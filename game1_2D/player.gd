extends Node2D


@export var speed = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	position = pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("mouse_left"):
		velocity.x -= 1
		
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	
