extends CharacterBody2D

@export_subgroup("Settings")
const SPEED = 135
const JUMP_VELOCITY = -300.00
var jump_change = 0
var dash_speed = 2
var dashing = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_change == 1:
		velocity.y = JUMP_VELOCITY
		$Jump.play()
		jump_change = 2
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()
		jump_change = 1
	
	if !Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jump_change = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if Input.is_action_pressed("dash"):
		if !dashing and direction:
			start_dash()
	if direction:
		if dashing:
			velocity.x = direction * SPEED * dash_speed # Left
		else:
			velocity.x = direction * SPEED
	else: 
		velocity.x = move_toward(velocity.x, 0, SPEED) # Right
	
	if velocity.x:
		$AnimatedSprite2D.flip_h = velocity.x < 0


	move_and_slide()

func start_dash():
	dashing = true
	$dash_time.start()

func stop_dash():
	dashing = false
