extends CanvasLayer

@onready var fade_rect: ColorRect = $ColorRect

func fade_to_black(duration := 1.5):
	fade_rect.mouse_filter = Control.MOUSE_FILTER_STOP

	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)
	await tween.finished


func fade_from_black(duration := 1.5):
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, duration)
	await tween.finished

	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
