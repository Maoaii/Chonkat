extends Panel

onready var resolution_picker = $UISettingsContainer/UIResolutionSettings
onready var is_fullscreen_picker = $UISettingsContainer/UICheckboxSettings

func _on_ApplyButton_pressed():
	# Get resolution picked
	var resolution = resolution_picker.get_selected_resolution()
	
	# Get fullscreen bool
	var fullscreen = is_fullscreen_picker.get_is_fullscreen()
	
	# Apply all settings
	OS.set_window_size(resolution)
	OS.set_window_fullscreen(fullscreen)
	
	# Close settings box
	self.visible = false


func _on_CancelButton_pressed():
	self.visible = false
# warning-ignore:return_value_discarded
	get_tree().change_scene_to(Global.LEVELS[0])
