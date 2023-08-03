extends CharacterBody2D 
 


#@export var speed = 140

@export var speed = 200
@export var jump_speed = -1800
@export var gravity = 4000
#var velocity = Vector2.ZERO



var player_moving = false

var player_state

var to_move = false

var current_over_entity

var inventory = {}

var can_move_down = false
var can_move_up = false

var portal_type : Constants.PortalType


func has_entity(entity_id):
	return entity_id in inventory


func use_entity(entity_id, remove):
	if has_entity(entity_id):
		var entity = inventory[entity_id]
		# Perform the action associated with the entity
		entity.perform_action()
		# Remove the entity from the inventory after use if remove
		if remove:
			inventory.erase(entity_id)


# Called when the node enters the scene tree for the first time.
func _ready():
	player_state = Constants.PlayerState.idle
	portal_type = Constants.PortalType.BLANK


func update_player(delta):
	to_move = true
	velocity = Vector2.ZERO
	
	# HORIZONTAL (with VERTICAL) Movement Controller
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1
#		if (can_move_down):
#			pass
#		if (can_move_up):
#			pass
#	if Input.is_action_pressed("move_right"):
#		velocity.x += 1
#		if (can_move_down):
#			pass
#		if (can_move_up):
#			pass
	velocity.y += gravity * delta

	# Input affects x axis only
	velocity.x = Input.get_axis("move_left", "move_right") * speed

	move_and_slide()

	
	# Down Movement Trigger
	if (Input.is_action_pressed("move_down")):
		can_move_down = true
		$Debug/down_pressed.visible = true
	if (Input.is_action_just_released("move_down")):
		can_move_down = false
		$Debug/down_pressed.visible = false
		
	# Up Movement Trigger
	if (Input.is_action_pressed("move_up")):
		can_move_up = true
	if (Input.is_action_just_released("move_up")):
		can_move_up = false


	
	if Input.is_action_just_pressed("pick_up"):
		if $InventoryManager.can_pickup_entity:
			print("can")
			if (current_over_entity != null):
				print("notNull")
				$InventoryManager.add_to_inventory(current_over_entity)
				current_over_entity = null
				
	if Input.is_action_pressed("move_down"):
		if portal_type != null:
			pass
			#velocity.y -1 = 

	if Input.is_action_just_pressed("space_bar"):
		print(1)
		if (current_over_entity != null && current_over_entity.space_to_trigger):
			print(2)
#			current_over_entity.try_to_open = true
			current_over_entity.trigger_entity_by_player()
#			current_over_entity.try_to_open = true			
#	velocity.y += gravity * delta
#	velocity.x *= delta
	
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * speed
#	move_and_slide()
#	if velocity.x > 0 || velocity.x < 0:
#		#to_move = collission == null
#		pass
#	#to_move = collission == null
#	if to_move:
#		player_moving = true
#		player_state = Constants.PlayerState.walking
#	else:
#		player_moving = false
	
	#else:
#		to_move = false
		#player_state = Constants.PlayerState.idle
		#player_moving = false
	
	if to_move:
		pass
		
	#position += velocity * delta
		#velocity = move_and_slide(velocity, Vector2.UP)
	#position += velocity * delta

func _process(delta):
	pass
	
	
	
#	match player_state:
		
#		Constants.PlayerState.walking:
#			if !$WalkingAnimatedSprite2D.is_playing():
#				$IdleAnimatedSprite2D.stop()
#				$WalkingAnimatedSprite2D.play("idle", false, false)
#		Constants.PlayerState.idle:
#			if !$IdleAnimatedSprite2D.is_playing():
#				$WalkingAnimatedSprite2D.stop()
#				$IdleAnimatedSprite2D.play("idle", false, false
