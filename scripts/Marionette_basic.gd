class_name PUPPETbasic
extends CharacterBody3D

@export var targets : Array[Node3D] = []
@export var SPEED = 100.0
const RotationSPEED = 4.0
const JUMP_VELOCITY = 4.5
var targetpos = 0
var currenttarget: Node3D = null
@onready var indicator: Sprite3D = $"../lockon/indicator"
var vent: bool = false


var RIGHTcontrol = 0
var LEFTcontrol = 0

func _physics_process(delta: float) -> void:
	#currenttarget = currenttargetfunc()
	#print("targetpos",targetpos)
	#print("all", targets)
	#print("current target", currenttarget)
	if indicator:
		if currenttarget:
			indicator.reparent(currenttarget, true)
			indicator.position = Vector3.UP * 5
			indicator.visible = true
		else:
			indicator.reparent(self)
			indicator.visible = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	var move_amount = (LEFTcontrol + RIGHTcontrol) * 0.5 * SPEED
	var rotation_amount = (RIGHTcontrol - LEFTcontrol) * RotationSPEED * delta
	
	var direction = -transform.basis.z * move_amount
	velocity.x = direction.x
	velocity.z = direction.z
	
	rotate_y(rotation_amount)
	move_and_slide()

func currenttargetfunc() -> Node3D:
	if targets.is_empty():
		return null
	return targets[targetpos]
	
func venti():
	vent = true
	print("vent passed")

func _on_interactable_slider_slider_movedL(position: Variant) -> void:
	LEFTcontrol = position

func _on_interactable_slider_slider_movedR(position: Variant) -> void:
	RIGHTcontrol = position
	
#func _on_lhand_input_vector_2_changed(name: String, value: Vector2) -> void:
	#pass # Replace with function body.

func _on_area_3d_body_entered(body: Node3D) -> void:
	targets.append(body)
	print("added:", body.name)
	currenttarget = currenttargetfunc()
	print("current target", currenttarget)

func _on_area_3d_body_exited(body: Node3D) -> void:
	targets.erase(body)
	print("removed:", body.name)
	currenttarget = currenttargetfunc()
	print("current target", currenttarget)

#func _on_right_hand_button_pressedR(name: String) -> void:
#	if targets.is_empty():
#		return
#	targetpos += 1
#	targetpos = targetpos % len(targets)
#	print("targetpos",targetpos)
#	print("all", targets)
#	print("current target", targets[targetpos])
	
#func _on_left_hand_button_pressedL(name: String) -> void:
#	if targets.is_empty():
#		return
#	targetpos -= 1
#	targetpos = targetpos % len(targets)
#	print(targetpos)
#	print("all", targets)
#	print("current target", targets[targetpos])
