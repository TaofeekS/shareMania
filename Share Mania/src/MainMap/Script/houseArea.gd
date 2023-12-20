extends Area2D

@export_file("*.tscn") var levelpath = "res://src/Levels/TestLevels/Scene/test_level.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if not get_parent().get_parent().carryingGift:
		return
	get_tree().change_scene_to_file(levelpath)
