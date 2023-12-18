extends CharacterBody2D


@export var SPEED = 220.0
const JUMP_VELOCITY = -400.0
var items = []
var carriedObject = null

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
		if carriedObject:
			if not carriedObject.allowJump():
				return
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	#setting sprite flip based on direction
	if direction == 1:
		$Sprite2D.flip_h = false
		$baseObjectPos.scale.x = 1
	elif direction == -1:
		$Sprite2D.flip_h = true
		$baseObjectPos.scale.x = -1
	
	
	if direction:
		var speedPenalty = 0
		if carriedObject:
			speedPenalty = carriedObject.getSpeedPenalty()
		velocity.x = direction * (SPEED - speedPenalty)
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
	
	if Input.is_action_just_pressed("pickItem"):
		
		if CarryingAnObject():
			dropCarriedObject()
		else:
			if items.size() != 0:
				pickObject()
	


func _on_item_detector_body_entered(body):
	items.append(body)


func _on_item_detector_body_exited(body):
	if items.has(body):
		items.erase(body)


func dropCarriedObject():
	carriedObject = $baseObjectPos/carriedObjectPos.get_child(0)
	$baseObjectPos/carriedObjectPos.remove_child(carriedObject)
	get_parent().add_child(carriedObject)
	 
	carriedObject.followParent = false
	carriedObject.position = $baseObjectPos/carriedObjectPos.global_position
	carriedObject = false


func pickObject():
	carriedObject = items[0]
	get_parent().remove_child(carriedObject)
	$baseObjectPos/carriedObjectPos.add_child(carriedObject)
	carriedObject.followParent = true
	$baseObjectPos/AnimationPlayer.play("pickObject")


func CarryingAnObject():
	return $baseObjectPos/carriedObjectPos.get_child_count() != 0
