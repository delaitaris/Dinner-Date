extends Area2D
var raising = false
var lowering = false
var clicking = false


func _ready() -> void:
	raising = true
	position.x = 185

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#moving
	if raising:
		position.y -= 7.5
	elif lowering:
		position.y += 7.5

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

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == "TopWall":
		raising = false
		lowering = true
	if area.name == "BottomWall":
		raising = true
		lowering = false
	if area.name == "RedUp" or "RedDown" and clicking:
		print("NO")
	if area.name == "OrangeUp" or "OrangeDown" and clicking:
		print("KINDA")
	if area.name == "Green" and clicking:
		print("YES")
