extends XRController3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var start = global_position + (-global_basis.z * 0.1)
	var end = (-global_basis.z * 1) + start
	
	$"LineRenderer".points[0] = start
	$"LineRenderer".points[1] = end

func _on_ax_button_pressed(name: String) -> void:
	if name == "ax_button":
		if $"LineRenderer".visible == false:
			$"LineRenderer".visible = true
			self.find_child("CollisionShape3D").disabled = false
		else:
			$"LineRenderer".visible = false
			self.find_child("CollisionShape3D").disabled = true

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent_node_3d().name != "LeftController" and area.get_parent_node_3d().name != "RightController":
		var color: Color = area.get_parent_node_3d().find_child("Cube").material.albedo_color
		if (color.r != 0 and self.get_name() == "LeftController") or (color.g != 0 and self.get_name() == "RightController"):
			var rand_num = randi_range(0, 1)
			if rand_num == 0:
				$"BeeperOne".play()
			else:
				$"BeeperTwo".play()
				
			area.get_parent_node_3d().queue_free()
