extends Area2D
var raising = false
var lowering = false
var clicking = false
var orange = false
var red = false
var green = false

func _ready() -> void:
	raising = true
	position.x = 185

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#moving
	if raising:
		position.y -= 1
	elif lowering:
		position.y += 1

#interaction
	if clicking:
		position.x = 175
	elif !clicking:
		position.x = 185

#interaction yes/no
	if Input.is_action_just_pressed("TextInteract"):
		clicking = true
		$"ClickTime".start()
	if clicking and Input.is_action_just_pressed("TextInteract"):
		pass

func _on_click_time_timeout() -> void:
	clicking = false


func _on_area_entered(area: Area2D) -> void:
	if area.name == "TopWall":
		raising = false
		lowering = true
	if area.name == "BottomWall":
		raising = true
		lowering = false
	if area.name == "RedUp" or "RedDown" and !green or !orange:
		red = true
		print("red")
	if area.name == "OrangeUp" or "OrangeDown" and !green or !red:
		orange = true
		print("orange")
	if area.name == "Green" and !red or !orange:
		green = true
		print("green")

func _on_area_exited(area: Area2D) -> void:
	if area.name == "RedUp" or "RedDown":
		red = false
	if area.name == "OrangeUp" or "OrangeDown":
		orange = false
	if area.name == "Green":
		green = false
