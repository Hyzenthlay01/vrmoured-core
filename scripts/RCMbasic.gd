extends VehicleBody3D

var enginepwr = 3000
@onready var left_wheel1 = $VehicleWheelL1
@onready var right_wheel1 = $VehicleWheelR1
@onready var left_wheel2 = $VehicleWheelL2
@onready var right_wheel2 = $VehicleWheelR2
@onready var camera1 = $Camera1

func _process(delta: float) -> void:
	var LEFTcontrol = Input.get_axis("forwardL", "backwardL")
	var RIGHTcontrol = Input.get_axis("forwardR", "backwardR")

	left_wheel1.engine_force = enginepwr * LEFTcontrol
	left_wheel2.engine_force = enginepwr * LEFTcontrol
	right_wheel1.engine_force = enginepwr * RIGHTcontrol
	right_wheel2.engine_force = enginepwr * RIGHTcontrol
		
	print("left", LEFTcontrol)
	print("right", RIGHTcontrol)
