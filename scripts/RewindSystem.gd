extends Node

var history: Array[DialogicSaveState] = []

@export var max_history_size: int = 100

var is_rewinding := false


func save_state() -> void:
	if is_rewinding:
		print("REWIND: Ignored save while rewinding.")
		return

	var state: DialogicSaveState = Dialogic.get_full_state()

	history.append(state)

	if history.size() > max_history_size:
		history.pop_front()

	print("REWIND: Saved state #", history.size())



func rewind() -> void:
	print("REWIND: Button pressed. History size = ", history.size())

	if history.size() < 2:
		print("REWIND: Not enough states to rewind!")
		return

	is_rewinding = true

	# Remove the state we're currently at.
	history.pop_back()

	var previous_state: DialogicSaveState = history.back()

	print("REWIND: Loading previous state.")

	Dialogic.load_full_state(previous_state)

	# Give Dialogic time to restore the state.
	await get_tree().process_frame
	await get_tree().process_frame

	is_rewinding = false

	print("REWIND: Rewind complete. History size = ", history.size())


func clear_history() -> void:
	history.clear()
