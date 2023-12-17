extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#get statemachine variable from animation tree
@onready var stateMachine = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	#setting sprite flip based on direction
	if direction == 1:
		$Sprite2D.flip_h = false
	elif direction == -1:
		$Sprite2D.flip_h = true
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	#this section controls the player movement
	if is_on_floor():
		if direction != 0:
			stateMachine.travel("run")
		else:
			stateMachine.travel("idle")
	
	else:
		if velocity.y > 0:
			stateMachine.travel("jump")
		else:
			stateMachine.travel("fall")
	
	
