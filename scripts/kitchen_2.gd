extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_spaghetti_button_pressed() -> void:
	Dialogic.start("spaghetti")
	get_tree().change_scene_to_file("res://scenes/talking.tscn")
	if Dialogic.current_timeline != null:
		pass



func _on_steak_button_pressed() -> void:
	Dialogic.start("steak")
	get_tree().change_scene_to_file("res://scenes/talking.tscn")
	if Dialogic.current_timeline != null:
		pass
