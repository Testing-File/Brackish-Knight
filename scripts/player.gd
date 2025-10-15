extends CharacterBody2D

const SPEED = 160
const JUMP_VELOCITY = -300.00


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED # Left
	else: 
		velocity.x = move_toward(velocity.x, 0, SPEED) # Right
	
	if velocity.x:
		$AnimatedSprite2D.flip_h = velocity.x < 0


	move_and_slide()
