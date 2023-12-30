extends Node2D

var speedPenalty = 0
var speedAnimPenalty = 0
var health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func updateHealthBar(force,dropTime):
	var damage = 0
	if dropTime == 20:
		damage = 1
	else:
		
		damage = dropTime * 10
	
	health -= damage * get_parent().get_parent().mass
	
	return health
