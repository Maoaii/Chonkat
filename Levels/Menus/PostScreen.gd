extends Control

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_PlayButton_pressed():
	if Global.current_level == Global.LEVELS[len(Global.LEVELS) - 1]:
# warning-ignore:return_value_discarded
		Global.current_treats = 0
		Global.current_level = Global.LEVELS[1]
		get_tree().change_scene_to(Global.LEVELS[0])
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene_to(Global.current_level)
