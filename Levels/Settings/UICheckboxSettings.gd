extends HBoxContainer


onready var checkbox = $CheckBox

var is_fullscreen = false

func get_is_fullscreen():
	return is_fullscreen


func _on_CheckBox_toggled(button_pressed):
	is_fullscreen = button_pressed
