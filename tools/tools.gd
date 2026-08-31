@tool
extends EditorScript


const TIMELINE_PATH := "res://dialogic resources/text/prologue/prologuetest.dtl"


func _run() -> void:
	var file := FileAccess.open(TIMELINE_PATH, FileAccess.READ)

	if file == null:
		print("AUTO SAVE: Could not open timeline!")
		return

	var text := file.get_as_text()
	file.close()

	var lines := text.split("\n")
	var output: Array[String] = []

	var save_count := 0
	var dialogue_lines: Array[String] = []


	for line in lines:
		var trimmed := line.strip_edges()

		# Blank line
		if trimmed == "":
			output.append(line)
			continue


		# Dialogic event, choice, variable assignment, etc.
		var is_dialogic_event := (
			trimmed.begins_with("[") or
			trimmed.begins_with("-") or
			trimmed.begins_with("set ")
		)


		if is_dialogic_event:
			# If we were just processing dialogue,
			# save after that dialogue event.
			if dialogue_lines.size() > 0:
				output.append("[signal arg=\"save_state\"]")
				save_count += 1
				dialogue_lines.clear()

			output.append(line)
			continue


		# Indented lines belong to choices / variables.
		if line.begins_with("\t"):
			output.append(line)
			continue


		# Otherwise this is dialogue text.
		dialogue_lines.append(line)
		output.append(line)


	# Save after dialogue at the end of the file.
	if dialogue_lines.size() > 0:
		output.append("[signal arg=\"save_state\"]")
		save_count += 1


	var new_text := "\n".join(output)

	var write_file := FileAccess.open(TIMELINE_PATH, FileAccess.WRITE)

	if write_file == null:
		print("AUTO SAVE: Could not write timeline!")
		return

	write_file.store_string(new_text)
	write_file.close()


	print("================================")
	print("AUTO SAVE: Finished!")
	print("AUTO SAVE: Added ", save_count, " save points.")
	print("================================")
