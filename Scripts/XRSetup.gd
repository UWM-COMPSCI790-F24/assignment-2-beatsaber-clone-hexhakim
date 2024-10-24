extends Node3D

var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")

func recenter() -> void:
	var theta = $XRCamera3D.rotation.y
	global_position = Vector3.ZERO
	global_rotation.y = -theta
	
	var offset_vector = $XRCamera3D.global_position * -1
	offset_vector.y = 0
	global_position = offset_vector

func _on_right_controller_joystick_pressed(name: String) -> void:
	if name == "primary_click":
		recenter()
