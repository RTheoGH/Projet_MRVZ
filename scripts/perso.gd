extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var previous_mouse_pos:Vector2 = DisplayServer.window_get_size()/2
@onready var cam_fps :Node3D = $Camera3D
var cam_speed = 0.5


func _physics_process(delta: float) -> void:
	var cam_diff = get_viewport().get_mouse_position() - previous_mouse_pos
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (cam_fps.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if(rad_to_deg(cam_fps.global_rotation.x - cam_diff.y * delta * cam_speed) < -80):
		print("C'est moins")
		cam_fps.global_rotation.x = deg_to_rad(-79.9)
	elif(rad_to_deg(cam_fps.global_rotation.x - cam_diff.y * delta * cam_speed) > 80):
		print(rad_to_deg(cam_fps.global_rotation.x))
		cam_fps.global_rotation.x = deg_to_rad(80)
	else:
		cam_fps.global_rotation.x -= cam_diff.y * delta * cam_speed

	
	cam_fps.global_rotation.y -= cam_diff.x * delta * cam_speed
	
	if get_viewport().get_window().has_focus():
		Input.warp_mouse(DisplayServer.window_get_size()/2)
	
	previous_mouse_pos = get_viewport().get_mouse_position()

	move_and_slide()
