class_name PUPPETbasic
extends CharacterBody3D

@export var targets : Array[Node3D] = []
@onready var lockon: Sprite3D = $lockon
@export var SPEED = 100.0
const RotationSPEED = 4.0
const JUMP_VELOCITY = 4.5


var RIGHTcontrol = 0
var LEFTcontrol = 0

func _physics_process(delta: float) -> void:
	#print(targets)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var move_amount = (LEFTcontrol + RIGHTcontrol) * 0.5 * SPEED
	var rotation_amount = (RIGHTcontrol - LEFTcontrol) * RotationSPEED * delta
	
	var direction = -transform.basis.z * move_amount
	velocity.x = direction.x
	velocity.z = direction.z
	
	rotate_y(rotation_amount)
	move_and_slide()


func _on_interactable_slider_slider_movedL(position: Variant) -> void:
	LEFTcontrol = position

func _on_interactable_slider_slider_movedR(position: Variant) -> void:
	RIGHTcontrol = position
	
func _on_lhand_input_vector_2_changed(name: String, value: Vector2) -> void:
	pass # Replace with function body.

func _on_area_3d_body_entered(body: Node3D) -> void:
	targets.append(body)
	#lockon.visible = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	targets.erase(body)
	#lockon.visible = false
