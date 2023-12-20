extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property($Control/HBoxContainer,"position",Vector2(-1155,0),12)
	
	await tween.finished
	$Control/HBoxContainer.position = Vector2(0,0)
	_ready()
	pass # Replace with function body.





