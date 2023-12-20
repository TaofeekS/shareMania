extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func GiftPicked():
	if $Control/boxHolder/giftBox.visible == true:
		return
	$Control/boxHolder/giftBox.show()
	$Control/boxHolder/giftBox.scale = Vector2(0,0)
	
	var tween = get_tree().create_tween()
	tween.tween_property($Control/boxHolder/giftBox,"scale",Vector2(1,1),0.3)
	
