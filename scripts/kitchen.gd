extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_chips_button_pressed() -> void:
	Dialogic.start("beerbatteredchips")
	get_tree().change_scene_to_file("res://scenes/kitchen_2.tscn")
	if Dialogic.current_timeline != null:
		pass


func _on_wings_button_pressed() -> void:
	Dialogic.start("buffalowings")
	get_tree().change_scene_to_file("res://scenes/kitchen_2.tscn")
	if Dialogic.current_timeline != null:
		pass
