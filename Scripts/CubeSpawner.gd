extends Node3D

@export var cube_scene : PackedScene

@export var pos : Vector3 = Vector3(0, 1.5, -8.0)

@export var color1 : Color
@export var color2 : Color

var cur_cube = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CubeTimer.timeout.connect(spawner)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawner():
	if cube_scene:
		var cube_object = cube_scene.instantiate()
		
		add_child(cube_object)
		
		cube_object.position = pos + Vector3(randf_range(-0.5, 0.5), 0, randf_range(-0.5, 0.5))
		
		var rand_color
		if randi_range(0, 1) == 0:
			rand_color = color1
		else:
			rand_color = color2
		
		var mat = StandardMaterial3D.new()
		mat.albedo_color = rand_color
		cube_object.find_child("Cube").material = mat
		
func _on_left_controller_by_button_pressed(name: String) -> void:
	if name == "by_button":
		$"Loading_Beeper".play()
		$CubeTimer.start()
		$Label3D.visible = false
		$Label3D2.visible = false
