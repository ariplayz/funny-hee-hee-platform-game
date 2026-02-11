extends CharacterBody3D

# Movement settings
@export var speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 900.0
@export var max_fall_speed: float = 900.0

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_fall_speed)

	# Horizontal movement
	var input_dir = Input.get_axis("move_left", "move_right")
	velocity.x = input_dir * speed

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# Move
	move_and_slide()
