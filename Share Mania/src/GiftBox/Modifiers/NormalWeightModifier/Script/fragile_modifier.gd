extends Node2D

var speedPenalty = 0
var speedAnimPenalty = 0
var healthBar = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func updateHealthBar(force):
	print(force)
