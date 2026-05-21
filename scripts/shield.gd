extends StaticBody2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("ShieldLeft") and rotation != 45:
		$WokSprite.rotation += -0.05
		$ShieldHB.rotation += -0.05
	if Input.is_action_pressed("ShieldRight") and rotation != 45:
		$WokSprite.rotation += 0.05
		$ShieldHB.rotation += 0.05
