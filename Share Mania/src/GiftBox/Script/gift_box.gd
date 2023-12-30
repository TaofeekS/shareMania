extends RigidBody2D

var followParent = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if followParent:
		global_position = get_parent().global_position
	pass


func allowJump():
	for node in $modifiers.get_children():
		var groups = node.get_groups()
		if groups.has("weight"):
			return false
	
	return true

func getSpeedPenalty():
	for node in $modifiers.get_children():
		var groups = node.get_groups()
		if groups.has("weight"):
			return node.speedPenalty
	
	return 0


func _on_body_entered(body):
	for node in $modifiers.get_children():
		var groups = node.get_groups()
		if groups.has("fragile"):
			var fragileHealth = node.updateHealthBar(linear_velocity,$dropTimer.wait_time - $dropTimer.time_left)
			
			var tween = get_tree().create_tween()
			tween.tween_property(get_parent().get_node("HUD/importantUi/modifierContainer/fragileWeight"),"value",fragileHealth,0.3)
	
	$dropTimer.stop()


func dropped():
	$dropTimer.start()

func getHealth():
	var totalHealth = 0
	
	for node in $modifiers.get_children():
		totalHealth += node.health
	
	var health = 100
	
	if totalHealth != 0:
		health = totalHealth/ $modifiers.get_child_count()
	 
	return health
