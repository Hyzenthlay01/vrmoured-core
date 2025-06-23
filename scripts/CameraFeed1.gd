extends Sprite3D

func _onready():
	# Load and instance only the RC camera viewport
	var rc_cam_viewport = preload("res://scenes/vehicle_body_3d.tscn").instantiate()
	add_child(rc_cam_viewport)  # Must be in the scene tree to render

	# Get the texture
	var cam_texture = rc_cam_viewport.get_texture()

	# Apply it to a Sprite3D's material
	var sprite3d = $"."

	# Ensure there's a material on the sprite
	if sprite3d.material == null:
		sprite3d.material = StandardMaterial3D.new()

	sprite3d.material.albedo_texture = cam_texture
