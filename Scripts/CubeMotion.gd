extends Node3D

@export var speed : float = 1.85

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.z += delta * speed
	
	if global_position.z >= 1:
		queue_free()
