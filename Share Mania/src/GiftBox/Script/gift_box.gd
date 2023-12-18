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
