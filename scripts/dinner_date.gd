extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
#calls dialogic to begin at start of opening
	Dialogic.start("prologue")
	if Dialogic.current_timeline != null:
		pass


func _on_dialogic_signal(argument:String):
	if argument == "selection":
		get_tree().change_scene_to_file("res://scenes/kitchen.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
