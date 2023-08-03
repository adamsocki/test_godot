# portal.gd
extends "res://Entity.gd"


@export var portal_type : Constants.PortalType
@export var portal_label : String
@export var portal_ender_vector : Vector2

var portal_angle : float
@export var floor_thickness : float

@export var portal_end : Constants.PortalSide

var portal_other_side

# Called when the node enters the scene tree for the first time.
func _ready():
	if (portal_end == Constants.PortalSide.SIDE_A):
		portal_other_side = $Portal
		# calculate distance
		var position__ = self.get_position()
		var a2 = portal_other_side.position.x * portal_other_side.position.x
		var b2 = portal_other_side.position.y * portal_other_side.position.y
		var h = sqrt(a2 + b2)
		$Floor.set_scale(Vector2(h * 0.125, floor_thickness * 0.125))
		
		#calc angle
		portal_angle = atan2(portal_other_side.position.y, portal_other_side.position.x)
		$Floor.rotate(portal_angle)
		portal_other_side.portal_angle = portal_angle
		$Floor.position.y += 192 + floor_thickness
		$Floor.position.x +=  floor_thickness / 2
		

	elif (portal_end == Constants.PortalSide.SIDE_B):
		portal_other_side = self.get_parent()
		$Floor.visible = false
	
	$Portal_Label.set_text(portal_label)
	
	pass # Replace with function body.


func get_portal_angle():
	return portal_angle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interact_player_body_entered(body):
	if body.get_collision_layer() == 1:
		body.portal_type = portal_type


func _on_interact_player_body_exited(body):
	if body.get_collision_layer() == 1:
		body.portal_type = Constants.PortalType.BLANK
