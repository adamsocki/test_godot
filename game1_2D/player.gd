extends CharacterBody2D 
 

@export var speed = 12000
@export var jump_speed = -1800
var gravity = 400


var player_moving = false
var player_state
var to_move = false
var current_over_entity
var inventory = {}
var can_move_down = false
var can_move_up = false
var portal_type : Constants.PortalType
var on_portal = false
var on_stairs = false
var stair_speed = 90
var direction = Vector2.ZERO


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

#func _physics_process(delta):
#	pass
#
#func update_direction():
#	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
#	velocity.x = direction.x * speed
#	#if not velocity.x == 0:
#
##	if Input.is_action_pressed("move_left"):
##		velocity.x -= 1
###		if (can_move_down):
###			pass
###		if (can_move_up):
###			pass
##	if Input.is_action_pressed("move_right"):
##		velocity.x += 1
##		if (can_move_down):
#			pass
#		if (can_move_up):
#			pass 

#func _unhandled_input(event):
##	if event.is_action("move_right") or event.is_action("move_left"):
#	#		update_direction()
#	pass


func update_player(delta):
	
	#to_move = true
	#update_movement()
	#velocity += speed * delta
	
	velocity = Vector2.ZERO
	
	# HORIZONTAL (with VERTICAL) Movement Controller
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	velocity.x *= delta * speed
	velocity.y += gravity * delta
	
	move_and_slide()
		
#		if (can_move_down):
#			pass
#		if (can_move_up):
#			pass
	
#		if (can_move_down):
#			pass
#		if (can_move_up):
#			pass

#	velocity.y +=  delta
#	var ray_collider = $RayCast2D.get_collider()
#	if ray_collider:
#
#		if ray_collider.is_in_group("ground"):
#			if $RayCast2D.get_collider().ground_type == Constants.GroundType.STAIRS:
#				#assert()
#				on_stairs = true
#			else:
#				on_stairs = false
#
#	if on_stairs:
#		#velocity.x = Input.get_axis("move_left", "move_right") * speed
#
#		var new_velocity = calculate_stair_velocity() 
#		velocity.x = Input.get_axis("move_left", "move_right") * speed * new_velocity.x
#		velocity.y = -new_velocity.y  * 1000# Implement the function to adjust the stair movement
#		#velocity.x = 0
#		print("Hi")
#	else:
#		velocity.x = Input.get_axis("move_left", "move_right") * speed
#
#	move_and_slide()
#
#	# Down Movement Trigger
#	if (Input.is_action_pressed("move_down")):
#		can_move_down = true
#		$Debug/down_pressed.visible = true
#
#
#	if (Input.is_action_just_released("move_down")):
#		can_move_down = false
#		$Debug/down_pressed.visible = false
#
#	# Up Movement Trigger
#	if (Input.is_action_pressed("move_up")):
#		can_move_up = true
#	if (Input.is_action_just_released("move_up")):
#		can_move_up = false
#
#
#
#	if Input.is_action_just_pressed("pick_up"):
#		if $InventoryManager.can_pickup_entity:
#			print("can")
#			if (current_over_entity != null):
#				print("notNull")
#				$InventoryManager.add_to_inventory(current_over_entity)
#				current_over_entity = null
#
#	if Input.is_action_pressed("move_down"):
#		if portal_type != null:
#			pass
#			#velocity.y -1 = 
#
#	if Input.is_action_just_pressed("space_bar"):
#		print(1)
#		if (current_over_entity != null && current_over_entity.space_to_trigger):
#			print(2)
##			current_over_entity.try_to_open = true
#			current_over_entity.trigger_entity_by_player()
##			current_over_entity.try_to_open = true
#	print($RayCast2D.get_collider())


#
#func calculate_stair_velocity() -> Vector2:
#	var raycast_result = $RayCast2D.get_collider()
#	if  $RayCast2D.is_colliding():
#		var normal = $RayCast2D.get_collision_normal()
#		print(normal)
#
#		var up_vector = Vector2(0, -1)
#
#		# Calculate the dot product to determine the angle between the stairs and the player's movement
#		var angle = normal.angle_to(up_vector)
#
#		# To keep the movement smooth, you can use a factor to control the speed on stairs
#		# Adjust this factor to control how fast the player moves on stairs
#		var stair_speed_factor = 0.6
#
#		# Calculate the stair velocity based on the angle and the stair_speed_factor
#		var stair_velocity = Vector2(cos(angle), sin(angle)) * 10 * stair_speed_factor
#
#		# Depending on the orientation of the stairs, the player might need to move upwards or downwards
#		# You can adjust the stair velocity direction based on the sign of the dot product
#		if normal.x < 0:
#			stair_velocity.x = stair_velocity.x
#		stair_velocity.y = -stair_velocity.y
#
#		#print(stair_velocity)
#		return stair_velocity
#	else:
#		return Vector2.ZERO





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

