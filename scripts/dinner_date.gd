extends Node2D

var block_dialogic_click := false

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_dialogic_timeline_ended)

	Dialogic.start("prologuetest")


func _on_dialogic_signal(argument: String):
	if argument == "save_state":
		RewindSystem.save_state()

	if argument == "selection":
		get_tree().change_scene_to_file("res://scenes/kitchen.tscn")

func _on_dialogic_timeline_ended():
	await Transition.fade_to_black(2.0)
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _input(event: InputEvent) -> void:
	if block_dialogic_click:
		get_viewport().set_input_as_handled()
