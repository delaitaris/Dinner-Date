extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#calls dialogic to begin at start of opening
	Dialogic.start("prologue")
	if Dialogic.current_timeline != null:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
