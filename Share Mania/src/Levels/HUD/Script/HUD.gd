extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	showObjective()
	pass # Replace with function body.


func showObjective():
	get_tree().paused = true
	$objectivesPanel.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_game_pressed():
	$objectivesPanel.hide()
	get_tree().paused = false
