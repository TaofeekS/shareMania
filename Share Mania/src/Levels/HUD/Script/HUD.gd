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

func show_deliver_panel():
	get_tree().paused = true
	$deliverPanel.show()
	var health = get_parent().giftBoxNode.getHealth()
	var tween = create_tween()
	tween.tween_property($deliverPanel/Panel/TextureRect/giftHealth,"value",health,0.4)


func _on_main_map_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://src/MainMap/Scene/main_map.tscn")
