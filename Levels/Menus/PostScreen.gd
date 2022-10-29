extends Control

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_PlayButton_pressed():
	PlayerConfig.reset_treats()
	
	if Global.current_level == Global.LEVELS[len(Global.LEVELS) - 1]:
# warning-ignore:return_value_discarded
		Global.reset_level()
		get_tree().change_scene_to(Global.LEVELS[0])
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene_to(Global.current_level)
