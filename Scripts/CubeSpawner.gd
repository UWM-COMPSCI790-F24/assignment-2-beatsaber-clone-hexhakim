extends Node3D

@export var cube1_scene : PackedScene
@export var cube2_scene : PackedScene

@export var position_one : Vector3 = Vector3(-0.25, 1.0, -5.0)
@export var position_two : Vector3 = Vector3(0.25, 1.0, -5.0)

@export var cube_size : Vector3 = Vector3(0.5, 0.5, 0.5)

@export var cube1_color : Color
@export var cube2_color : Color

var cur_cube = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CubeTimer.timeout.connect(spawner)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawner():
	var pos1
	var pos2
	if randi_range(0, 1) == 0:
		pos1 = position_one + Vector3(0, 0, randf_range(0, 2))
		pos2 = position_two + Vector3(0, 0, randf_range(0, 2))
	else:
		pos1 = position_two + Vector3(0, 0, randf_range(0, 2))
		pos2 = position_one + Vector3(0, 0, randf_range(0, 2))
		
	if cube1_scene:
		var cube1_object = cube1_scene.instantiate()
		
		add_child(cube1_object)
		
		cube1_object.position = pos1
		cube1_object.scale = cube_size
		
		var mat = StandardMaterial3D.new()
		mat.albedo_color = cube1_color
		cube1_object.find_child("Cube").material = mat
		
	if cube2_scene:
		var cube2_object = cube2_scene.instantiate()
		
		add_child(cube2_object)
		
		cube2_object.position = pos2
		cube2_object.scale = cube_size
		
		var mat2 = StandardMaterial3D.new()
		mat2.albedo_color = cube2_color
		cube2_object.find_child("Cube").material = mat2
		
