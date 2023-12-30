extends Node2D

var giftBoxNode = null
# Called when the node enters the scene tree for the first time.
func _ready():
	giftBoxNode = $GiftBox
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	
	if is_instance_valid($Player.carriedObject):
		if $Player.carriedObject.name == "GiftBox":
			$HUD.show_deliver_panel()
			
