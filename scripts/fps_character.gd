extends Node3D

@export var mouse_sensitivity: float = 0.001
@onready var ray_cast_3d: RayCast3D = $RayCast3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		if ray_cast_3d.is_colliding():
			var collider_name = ray_cast_3d.get_collider().get_name()
			print(collider_name)
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		rotate_y(-event.relative.x * mouse_sensitivity)
