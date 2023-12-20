extends CharacterBody2D


const SPEED = 200.0
var giftPileNode = null

@onready var stateMachine = $AnimationTree.get("parameters/playback")

func _physics_process(delta):
	var direction = Vector2()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up","ui_down")
	if direction:
		velocity = direction * SPEED
		$AnimationTree.set("parameters/idle/blend_position",direction.normalized())
		$AnimationTree.set("parameters/walk/blend_position",direction.normalized())
		stateMachine.travel("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		stateMachine.travel("idle")
	
	if is_instance_valid(giftPileNode):
		if Input.is_action_pressed("pickItem"):
			get_parent().add_gift_to_hand()
	

	move_and_slide()


func _on_area_2d_body_entered(body):
	giftPileNode = body
	body.get_node("AnimationPlayer").play("focus")



func _on_area_2d_body_exited(body):
	body.get_node("AnimationPlayer").play("unfocus")
	giftPileNode = null
