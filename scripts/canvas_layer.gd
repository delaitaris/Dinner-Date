extends CanvasLayer

@onready var fade_rect: ColorRect = $ColorRect
@onready var credits_label: Label = $CreditsLabel

func _ready():
	fade_rect.modulate.a = 0.0
	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	credits_label.hide()

func fade_to_black(duration := 1.5):
	fade_rect.mouse_filter = Control.MOUSE_FILTER_STOP

	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, duration)
	await tween.finished

	credits_label.modulate.a = 0.0
	credits_label.show()

	var credits_tween = create_tween()
	credits_tween.tween_property(credits_label, "modulate:a", 1.0, 2.0)
	await credits_tween.finished

	await get_tree().create_timer(10.0).timeout

func fade_from_black(duration := 1.5):
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0.0, duration)
	await tween.finished

	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
