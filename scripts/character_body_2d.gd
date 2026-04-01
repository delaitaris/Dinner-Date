extends CharacterBody2D


const SIDE = 300.0
const UP = -300.0
const DOWN = 300.0


func _physics_process(delta: float) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("Up"):
		velocity.y = UP
		$"Movement".start()
	if Input.is_action_just_pressed("Down"):
		velocity.y = DOWN
		$"Movement".start()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SIDE
	else:
		velocity.x = move_toward(velocity.x, 0, SIDE)

	move_and_slide()

func _on_movement_timeout() -> void:
	velocity.y = 0.0
	velocity.x = 0.0
