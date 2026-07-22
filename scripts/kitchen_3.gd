extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_button_pressed() -> void:
	Dialogic.start("chocolatecake")
	get_tree().change_scene_to_file("res://scenes/end.tscn")
	if Dialogic.current_timeline != null:
		pass





func _on_bananasplit_button_pressed() -> void:
	Dialogic.start("bananasplit")
	get_tree().change_scene_to_file("res://scenes/end.tscn")
	if Dialogic.current_timeline != null:
		pass
