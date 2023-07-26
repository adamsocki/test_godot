extends CharacterBody2D 
 


@export var speed = 140
var player_moving = false

var player_state

var to_move = false

var current_over_entity

var inventory = {}





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


func update_player(delta):
	to_move = false
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1


	if Input.is_action_just_pressed("pick_up"):
		if $InventoryManager.can_pickup_entity:
			print("can")
			if (current_over_entity != null):
				print("notNull")
				$InventoryManager.add_to_inventory(current_over_entity)
				current_over_entity = null

	if Input.is_action_just_pressed("space_bar"):
		print(1)
		if (current_over_entity != null && current_over_entity.space_to_trigger):
			print(2)
#			current_over_entity.try_to_open = true
			current_over_entity.trigger_entity_by_player()
#			current_over_entity.try_to_open = true			

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		var collission = move_and_collide(velocity * delta)
		to_move = collission == null
		if to_move:
			player_moving = true
			player_state = Constants.PlayerState.walking
		else:
			player_moving = false
	else:
		to_move = false
		player_state = Constants.PlayerState.idle
		player_moving = false
	
	if to_move:
		position += velocity * delta

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
