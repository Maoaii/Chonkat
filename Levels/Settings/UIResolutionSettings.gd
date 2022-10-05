extends HBoxContainer

onready var resolutions = $Resolutions

func _ready():
	resolutions.select(1)

func get_selected_resolution():
	var new_resolution = resolutions.get_item_text(resolutions.selected).split("x")
	
	return Vector2(new_resolution[0], new_resolution[1])
