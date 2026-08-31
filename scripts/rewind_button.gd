extends Button


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			# Stop Dialogic from processing this click.
			Dialogic.Inputs.block_input(0.5)

			# Mark the mouse event as handled.
			get_viewport().set_input_as_handled()

			# Rewind the dialogue.
			RewindSystem.rewind()

			# Stop the event from being passed any further.
			accept_event()
