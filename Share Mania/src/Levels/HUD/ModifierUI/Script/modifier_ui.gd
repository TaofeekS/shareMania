extends Control

var modifierData = {
	"Heavy Item" : {
		"texturePath" : "res://assets/modifierIcon/heavyWeight.png",
		"description" : "you cant jump with gift"
	},
	"Fragile Item" : {
		"texturePath" : "res://assets/modifierIcon/fragileIcon.png",
		"description" : "Dont drop item"
	}
}
@export var modifierName = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Label.text = modifierName
	$icon.texture = load(modifierData[modifierName]["texturePath"])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
