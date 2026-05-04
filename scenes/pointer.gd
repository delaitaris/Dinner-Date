extends Area2D
var raising = false
var lowering = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raising = true
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raising:
		position.y -= 7.5
	elif lowering:
		position.y -= -7.5


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.name == "TopWall":
		raising = false
		lowering = true
	if area.name == "BottomWall":
		raising = true
		lowering = false
