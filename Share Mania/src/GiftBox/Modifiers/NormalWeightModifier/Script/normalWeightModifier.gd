extends Node2D

var speedPenalty = 60
var speedAnimPenalty = 0.3
var healthBar = 100
var mass = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_parent().mass = mass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
